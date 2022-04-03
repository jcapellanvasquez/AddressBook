package com.example.addcressbook.security;


import com.example.addcressbook.repositories.UserRepository;
import com.example.addcressbook.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class MyUserDetails implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
             final com.example.addcressbook.entities.User tuser = userRepository.findByUsername(username);

            if (tuser == null) {
                throw new UsernameNotFoundException("User '" + username + "' not found");
            }

            UserDetails User = org.springframework.security.core.userdetails.User
                    .withUsername(username)
                    .password(tuser.getPassword())
                    .authorities(new HashSet<GrantedAuthority>())
                    .accountExpired(false)
                    .accountLocked(false)
                    .credentialsExpired(false)
                    .disabled(false)
                    .build();

            return User;
        } catch(Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
}
