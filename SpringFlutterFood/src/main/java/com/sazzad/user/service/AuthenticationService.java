package com.sazzad.user.service;

import java.util.Optional;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.sazzad.user.dto.AuthenticationRequest;
import com.sazzad.user.dto.AuthenticationResponse;
import com.sazzad.user.dto.RegisterRequest;
import com.sazzad.user.entity.User;
import com.sazzad.user.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
	private final UserRepository repository;
	private final PasswordEncoder passwordEncoder;
	private final JwtService jwtService;
	private final AuthenticationManager authenticationManager;

	public AuthenticationResponse register(RegisterRequest request) {
		var user = User
				.builder()
				.firstname(request.getFirstname())
				.lastname(request.getLastname())
				.email(request.getEmail())
				.password(passwordEncoder.encode(request.getPassword()))
				.role(request.getRole())
				.build();
		repository.save(user);
		
		var jwtToken = jwtService.generateToken(user);
		return AuthenticationResponse
				.builder()
				.token(jwtToken)
				.build();
	}

	public AuthenticationResponse authenticate(AuthenticationRequest request) {
		authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
		var user = repository.findByEmail(request.getEmail()).orElseThrow();
		
		var jwtToken = jwtService.generateToken(user);
		return AuthenticationResponse
				.builder()
				.token(jwtToken)
				.build();
	}
	
	public Optional<User> getUserByEmail(String email) {
        return repository.findByEmail(email);
    }

}
