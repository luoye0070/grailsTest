package com.lj.test

class Ttest {

    boolean isGood;
    int iTest;
    double dlTest;
    float ftTest;
    Date dtTest;
    String sTest;
    short stTest;
    OneTest oneTest;
    List secondTests;
    TimeZone tz;
    Locale ll;
    Currency cc;
    static hasMany = [secondTests:SecondTest];
    static constraints = {
        iTest(inList: [1,2,3]);
    }

    @Override
    public java.lang.String toString() {
        return "Ttest{" +
                "id=" + id +
                ", isGood=" + isGood +
                ", iTest=" + iTest +
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
