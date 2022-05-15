package com.Quan.TryJWT.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.model.District;
import com.Quan.TryJWT.model.Province;
import com.Quan.TryJWT.model.Ward;
import com.Quan.TryJWT.repository.AddressRepository;
import com.Quan.TryJWT.repository.DistrictRepository;
import com.Quan.TryJWT.repository.ProvinceRepository;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.repository.WardRepository;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/address")
public class AddressController {
    @Autowired
    private ProvinceRepository provinceDao;
    @Autowired
    private DistrictRepository districtDao;
    @Autowired
    private WardRepository wardDao;
    @Autowired
    private AddressRepository addressDao;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/province")
    private ResponseEntity<List<Province>> getAllProvince() {
        ArrayList<Province> list = (ArrayList<Province>) provinceDao.findAll();
        return ResponseEntity.ok(list);
    }

    @GetMapping("/district/{id}")
    private ResponseEntity<List<District>> getAllDistrictByProvinceId(@PathVariable("id") String provinceId) {
        return ResponseEntity.ok(districtDao.findAllDistrictByIdProvince(provinceId));
    }

    @GetMapping("/ward/{id}")
    private ResponseEntity<List<Ward>> getAllVillageByDistrictId(@PathVariable("id") String districtId) {
        return ResponseEntity.ok(wardDao.findAllVillageByIdDistrict(districtId));
    }

}
