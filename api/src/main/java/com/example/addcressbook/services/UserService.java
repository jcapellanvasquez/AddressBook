package com.example.addcressbook.services;

import com.example.addcressbook.entities.User;
import com.example.addcressbook.exceptions.UserAuthenticationException;
import com.example.addcressbook.models.UserCredential;
import com.example.addcressbook.repositories.UserRepository;
import com.example.addcressbook.security.JwtTokenProvider;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.InvalidDataAccessResourceUsageException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class UserService {

    final UserRepository userRep;
    final PasswordEncoder passwordEncoder;
    final AuthenticationManager authenticationManager;
    final JwtTokenProvider jwtTokenProvider;

    UserService(UserRepository userRepository,
                PasswordEncoder passwordEncoder,
                JwtTokenProvider jwtTokenProvider,
                AuthenticationManager authenticationManager) {
        this.userRep = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtTokenProvider = jwtTokenProvider;
        this.authenticationManager = authenticationManager;
    }

    public User findByUsuario(String username) {
        return this.userRep.findByUsername(username);
    }

    public ResponseEntity<Map> auth(UserCredential credential) throws UserAuthenticationException {
        User user;

        try {
            user = findByUsuario(credential.getUsername());

            if (user == null) {
                throw new UserAuthenticationException("User not found");
            }

            if (!passwordEncoder.matches(credential.getPassword(), user.getPassword())) {
                throw new UserAuthenticationException("Wrong password");
            }

            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(credential.getUsername(), credential.getPassword()));
            Map rs = new HashMap();
            rs.put("token", jwtTokenProvider.createToken(credential.getUsername(), user));
            return new ResponseEntity<>(rs, HttpStatus.ACCEPTED);
        } catch (InvalidDataAccessResourceUsageException e) {
            throw new UserAuthenticationException("User not found");
        } catch (Exception e) {
            throw e;
        }
    }
}
