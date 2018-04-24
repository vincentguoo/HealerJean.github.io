package com.hlj.many.datasourse.dataresource.dao.data;

import com.hlj.many.datasourse.dataresource.dao.data.entry.PersonOne;
import com.hlj.many.datasourse.dataresource.dao.db.entry.PersonTwo;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface PersonOneDao extends CrudRepository<PersonOne,Long> {

    List<PersonOne> findAll();
}
