package com.salonbooking.salonbackend.service;

import com.salonbooking.salonbackend.dto.AuthResponse;
import com.salonbooking.salonbackend.dto.RegisterRequest;
import com.salonbooking.salonbackend.entity.Customer;
import com.salonbooking.salonbackend.enums.Gender;
import com.salonbooking.salonbackend.enums.Role;
import com.salonbooking.salonbackend.repository.CustomerRepository;
import com.salonbooking.salonbackend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final CustomerRepository customerRepository;


    public AuthResponse register(RegisterRequest request) {

        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new RuntimeException("Email is already taken");
        }


        Customer customer = new Customer();

        customer.setFullName(request.getFullName());
        customer.setEmail(request.getEmail());
        customer.setPassword(request.getPassword());
        customer.setPhone(request.getPhone());
        customer.setRole(Role.CUSTOMER);


        if (request.getGender() != null) {
            customer.setGender(
                    Gender.valueOf(request.getGender().toUpperCase())
            );
        }

        customer.setPreferences(request.getPreferences());


        customerRepository.save(customer);


        return new AuthResponse(
                null,
                customer.getRole().name()
        );
    }
}