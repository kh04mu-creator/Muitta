package com.springboot.project.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.project.dto.muListDTO;
import com.springboot.project.dto.reviewDTO;

import jakarta.servlet.ServletContext;

@Controller
public class homeController {

    @Autowired
    DataSource dataSource;
    @Autowired
    ServletContext application;

    @RequestMapping("/")
    public String home(Model model) throws Exception {

        Connection conn = dataSource.getConnection();

        Path path = Paths.get("config/home-md.txt");
        
     // 1) 파일에서 md_no 읽기(있으면)
        Integer fileMdNo = null;
        if (Files.exists(path)) {
            String s = Files.readString(path).trim();
            if (!s.isEmpty()) fileMdNo = Integer.parseInt(s);
        }
     // 2) 우선 파일 md_no로 조회
        boolean found = false;

        if (fileMdNo != null) {
            try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM MD WHERE MD_NO=?")) {
                ps.setInt(1, fileMdNo);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        found = true;
                        model.addAttribute("md_no", rs.getInt("MD_NO"));
                        model.addAttribute("md_title", rs.getString("MD_TITLE"));
                        model.addAttribute("md_upload", rs.getString("MD_UPLOAD"));
                        model.addAttribute("md_memo", rs.getString("MD_MEMO"));
                    }
                }
            }
        }

        // 3) 없으면(삭제됨/잘못됨) → 최신 1개로 fallback + 파일도 그 md_no로 덮어쓰기
        if (!found) {
            String latestSql = """
                SELECT *
                FROM (SELECT * FROM MD ORDER BY MD_START DESC)
                WHERE ROWNUM = 1
            """;

            try (PreparedStatement ps2 = conn.prepareStatement(latestSql);
                 ResultSet rs2 = ps2.executeQuery()) {

                if (rs2.next()) {
                    int newHomeNo = rs2.getInt("MD_NO");

                    model.addAttribute("md_no", newHomeNo);
                    model.addAttribute("md_title", rs2.getString("MD_TITLE"));
                    model.addAttribute("md_upload", rs2.getString("MD_UPLOAD"));
                    model.addAttribute("md_memo", rs2.getString("MD_MEMO"));

                    // ⭐ 파일 갱신: 다음부터는 이걸 홈으로
                    Files.createDirectories(path.getParent());
                    Files.writeString(path, String.valueOf(newHomeNo));
                } else {
                    // MD 테이블이 비어있으면 파일도 삭제
                    Files.deleteIfExists(path);
                }
            }
        }

        String mdSql;
        PreparedStatement mdPstmt;

        if (Files.exists(path)) {

            // ⭐ 파일에서 md_no 읽기
            String savedNo = Files.readString(path).trim();
            int mdNo = Integer.parseInt(savedNo);

            mdSql = "SELECT * FROM MD WHERE MD_NO=?";
            mdPstmt = conn.prepareStatement(mdSql);
            mdPstmt.setInt(1, mdNo);

        } else {

            // ⭐ 파일 없으면 최신 MD
            mdSql = """
                SELECT *
                FROM (SELECT * FROM MD ORDER BY MD_START DESC)
                WHERE ROWNUM = 1
            """;
            mdPstmt = conn.prepareStatement(mdSql);
        }

        ResultSet mdRs = mdPstmt.executeQuery();

        if (mdRs.next()) {
            model.addAttribute("md_no", mdRs.getInt("MD_NO"));
            model.addAttribute("md_title", mdRs.getString("MD_TITLE"));
            model.addAttribute("md_upload", mdRs.getString("MD_UPLOAD"));
            model.addAttribute("md_memo", mdRs.getString("MD_MEMO"));
        }

        mdRs.close();
        mdPstmt.close();

        

        /* =========================
         * 2️⃣ 베스트 후기 TOP 10
         * ========================= */
        String reviewSql = """
            SELECT r.R_NO,
                   r.R_TITLE,
                   r.R_WRITER,
                   r.R_DATE,
                   r.R_VIEW,
                   r.R_STAR,
                   r.R_DETAIL,
                   r.R_UPLOAD,
                   r.M_NO,
                   COUNT(l.R_NO) AS LIKECOUNT
            FROM REVIEW r
            LEFT JOIN RW_LIKE l ON r.R_NO = l.R_NO
            GROUP BY r.R_NO, r.R_TITLE, r.R_WRITER, r.R_DATE, r.R_VIEW,
                     r.R_STAR, r.R_DETAIL, r.R_UPLOAD, r.M_NO
            ORDER BY LIKECOUNT DESC
            FETCH FIRST 10 ROWS ONLY
        """;

        PreparedStatement reviewPstmt = conn.prepareStatement(reviewSql);
        ResultSet reviewRs = reviewPstmt.executeQuery();

        List<reviewDTO> bestReviews = new ArrayList<>();

        while (reviewRs.next()) {
            reviewDTO review = new reviewDTO();
            review.setR_no(reviewRs.getInt("R_NO"));
            review.setR_title(reviewRs.getString("R_TITLE"));
            review.setR_writer(reviewRs.getString("R_WRITER"));
            review.setR_date(reviewRs.getDate("R_DATE"));
            review.setR_view(reviewRs.getInt("R_VIEW"));
            review.setR_star(reviewRs.getDouble("R_STAR"));
            review.setR_detail(reviewRs.getString("R_DETAIL"));
            review.setR_upload(reviewRs.getString("R_UPLOAD"));
            review.setM_no(reviewRs.getInt("M_NO"));
            review.setLikeCount(reviewRs.getInt("LIKECOUNT"));

            bestReviews.add(review);
        }

        reviewRs.close();
        reviewPstmt.close();

        model.addAttribute("bestReviews", bestReviews);

     // -------------------------
     // 3️⃣ 뮤지컬 리스트 (홈 카드 슬라이드)
     // -------------------------
     String muSql = """
         SELECT MU_NO,
                MU_TITLE,
                MU_START,
                MU_END,
                MU_PUPLOAD
         FROM MU_LIST
         ORDER BY MU_START DESC
     """;

     PreparedStatement muPstmt = conn.prepareStatement(muSql);
     ResultSet muRs = muPstmt.executeQuery();

     List<muListDTO> musicalList = new ArrayList<>();

     while (muRs.next()) {
         muListDTO mu = new muListDTO();
         mu.setMu_no(muRs.getInt("MU_NO"));
         mu.setMu_title(muRs.getString("MU_TITLE"));
         mu.setMu_start(muRs.getString("MU_START"));
         mu.setMu_end(muRs.getString("MU_END"));
         mu.setMu_pupload(muRs.getString("MU_PUPLOAD"));

         musicalList.add(mu);
     }

     muRs.close();
     muPstmt.close();

     model.addAttribute("musicalList", musicalList);


        conn.close();

        return "home";
    }
}
