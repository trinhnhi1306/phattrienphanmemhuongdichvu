package com.Quan.TryJWT.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


import lombok.Getter;
import lombok.Setter;



@Entity
@Table(name = "address")
@Getter
@Setter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Address {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id")
	private long addressId;
	
	 
	 @ManyToOne
	 @JoinColumn(name = "ward_id")
	private Ward ward;
	
	 @Column(name = "specific_address",length = 100)
	private String specificAddress;
	

	 
	 @JsonIgnore
	 @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	   @JoinTable(name = "user_address",
	            joinColumns = @JoinColumn(name = "address_id"),  
	            inverseJoinColumns = @JoinColumn(name = "user_id")
	    )
	    private Set<User> setUsers = new HashSet<User>();

}
