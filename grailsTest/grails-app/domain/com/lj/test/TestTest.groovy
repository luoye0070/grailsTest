package com.lj.test

import com.lj.test.over.OneOverTest

class TestTest {
    boolean isGood;
    int iiTest;
    double dlTest;
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
    }

    @Override
    public java.lang.String toString() {
        return "Ttest{" +
                "id=" + id +
                ", isGood=" + isGood +
                ", iTest=" + iiTest +
                ", dlTest=" + dlTest +
                ", ftTest=" + ftTest +
                ", dtTest=" + dtTest +
                ", sTest='" + sTest + '\'' +
                ", stTest=" + stTest +
                ", oneTest=" + oneTest +
                ", secondTests=" + secondTests +
                ", tz=" + tz +
                ", ll=" + ll +
                ", cc=" + cc +
                ", version=" + version +
                '}';
    }
}
