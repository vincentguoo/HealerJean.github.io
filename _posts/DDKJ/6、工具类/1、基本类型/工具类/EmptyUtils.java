package com.duodian.youhui.admin.utils;


import org.apache.commons.lang.StringUtils;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

public final class EmptyUtils {

   private static final Integer INTEGER_0 = 0 ;
   private static final Long LONG_0 = 0L ;
   private static final BigDecimal BIGDECIMAL_0 = BigDecimal.ZERO;


    public final static boolean isEmpty(String str) {
        return str == null || str.length() <= 0;
    }

    public final static boolean isEmpty(Collection collection) {
        return collection == null || collection.isEmpty();
    }
    public final static boolean isEmpty(Map map) {
        return map == null || map.isEmpty();
    }

    public final static boolean isNullAnd0(BigDecimal decimal){
        return    (decimal==null||BIGDECIMAL_0.compareTo(decimal)==0)?true:false;
    }

    public final static boolean isNullAnd0(Integer integer){
        return    (integer==null||INTEGER_0.compareTo(integer)==0)?true:false;
    }
    public final static boolean isNullAnd0(Long l){
        return    (l==null||LONG_0.compareTo(l)==0)?true:false;
    }


}
