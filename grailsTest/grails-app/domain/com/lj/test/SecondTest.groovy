package com.lj.test

class SecondTest {
    String name;
    OneTest ot;
    static belongsTo = [ot:OneTest];
    static constraints = {
    }
    static hasMany = [ots: OneTestSub];
}
