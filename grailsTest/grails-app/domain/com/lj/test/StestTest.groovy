package com.lj.test

import com.lj.test.over.OneOverTest

class StestTest {
    boolean isGood;
    int iiTest;
    double dlTest;
    double ddllTest;
    float ftTest;
    long lTest;
    byte bTest;
    char cTest;
    Date dtTest;
    String sTest;
    short stTest;
    OneTest oneTest;
    List secondTests;
    TimeZone tz;
    Locale ll;
    Currency cc;
    OneOverTest oot;
    static hasMany = [secondTests:SecondTest];
    static constraints = {
        iiTest(inList: [1,2,3]);
        //ddllTest(inList: [1.0,0.89,23]);
    }

}
