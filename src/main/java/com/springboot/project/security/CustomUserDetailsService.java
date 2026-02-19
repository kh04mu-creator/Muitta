package com.springboot.project.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springboot.project.dao.memberDAO;
import com.springboot.project.dto.memberDTO;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final memberDAO memberDao;

    public CustomUserDetailsService(memberDAO memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public UserDetails loadUserByUsername(String userId)
            throws UsernameNotFoundException {

        memberDTO member = memberDao.findByUserId(userId);

        if (member == null) {
            throw new UsernameNotFoundException("사용자 없음");
        }

        return new CustomUserDetails(member);
    }
}
