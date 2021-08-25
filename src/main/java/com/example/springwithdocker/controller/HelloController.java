package com.example.springwithdocker.controller;

import com.example.springwithdocker.Repository.StaffRepository;
import com.example.springwithdocker.model.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/hello")
public class HelloController {
    private final StaffRepository staffRepository;

    @Autowired
    public HelloController(StaffRepository staffRepository) {
        this.staffRepository = staffRepository;
    }

    @GetMapping(value = "/staff")
    public ResponseEntity<List<Staff>> getAllStaff() {
        List<Staff> responseValue = new ArrayList<>();
        Iterable<Staff> staffs = staffRepository.findAll();
        staffs.forEach(responseValue::add);
        return ResponseEntity.ok(responseValue);
    }
}
