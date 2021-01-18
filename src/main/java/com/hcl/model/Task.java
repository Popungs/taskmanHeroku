package com.hcl.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name="taskmanDb")
public class Task {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String taskName;
	
	private String description;
	private String email;
	private String severe;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	@Temporal(TemporalType.DATE)
	private Date endDate;

}
