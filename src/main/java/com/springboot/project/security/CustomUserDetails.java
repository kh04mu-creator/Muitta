package com.springboot.project.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.springboot.project.dto.memberDTO;

public class CustomUserDetails implements UserDetails {

    private final memberDTO member;

    public CustomUserDetails(memberDTO member) {
        this.member = member;
    }

    //  member 전체 접근 (이미 있음)
    public memberDTO getMember() {
        return member;
    }

    //  mno 바로 꺼내기 (⭐ 중요)
    public int getMno() {
        return member.getM_no();   // ← 컬럼명에 맞게
    }

    //  로그인 아이디
    public String getLoginId() {
        return member.getM_id();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singleton(
            new SimpleGrantedAuthority(member.getM_auth())
        );
    }

    @Override
    public String getPassword() {
        return member.getM_password();
    }

    @Override
    public String getUsername() {
        return member.getM_id();
    }

    @Override public boolean isAccountNonExpired() { return true; }
    @Override public boolean isAccountNonLocked() { return true; }
    @Override public boolean isCredentialsNonExpired() { return true; }
    @Override public boolean isEnabled() { return true; }
}
