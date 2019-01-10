package com.example.demoboot.mapper;

import com.example.demoboot.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

public class ItemMapperTest {
    @Test
    public void test() {
        SqlSession sqlSession = SqlSessionFactoryUtils.getInstace().getSqlSessionFactory().openSession();
        ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
        mapper.selectItemById(14);
    }
}