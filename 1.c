#include <stdio.h>

int MajorCode[1];   
int Grade[1];       
int Class[1];       
int ClassNumber[1];

int major_mul = 1000000;  
int grade_mul = 10000;    
int class_mul = 100;     

void StudentNumber(int major[], int grade[], int class[], int classNumber[]) {
    int majorCode;
    int gradeValue;
    int classValue;
    int classNum;
    int result;
    
    majorCode = major[0];
    gradeValue = grade[0];
    classValue = class[0];
    classNum = classNumber[0];
    
    result = majorCode * major_mul + gradeValue * grade_mul + classValue * class_mul + classNum;
    
    // 输出学号
    printf("%d\n", result);
    return;
}

int main(void) {
    MajorCode[0] = 1033;  // 专业代码
    Grade[0] = 22;        // 年级
    Class[0] = 1;         // 班级（🌟需修改）
    ClassNumber[0] = 8;   // 班级学号（🌟需修改）
    
    // 输出学号
    StudentNumber(MajorCode, Grade, Class, ClassNumber);
    
    return 0;
}