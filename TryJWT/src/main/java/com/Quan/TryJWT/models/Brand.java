package com.Quan.TryJWT.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Entity
@Table(name = "brand")
@Getter
@Setter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Brand {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "brand_id")
	private long brandId;
	
	
	@Column(name = "name",length = 100)
	private String name;
	
	@Column(name = "description",length = 200)
	private String description;
	
	@OneToMany(mappedBy = "brand",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private Set<Product> brands = new HashSet<>();
}
