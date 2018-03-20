#include <iostream>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define Bl_Square(x) x *x
#define Bl_MIN(x, y) ((x) < (y) ? (x) : (y))
#define Bl_MAX(x, y) ((x) > (y) ? (x) : (y))

//limit x from -max to max
double blSaturate(double x, double max) {
    if (x > max) {
        return max;
    } else if (x < (-max)) {
        return -max;
    } else {
        return x;
    }
}

typedef struct {
    double target;       //target travel
    double progress;     //travel progress
    double current_vel;  //current vel
    double current_acc;  //
    double inter_period; //插补周期

    //---------------
    double req_acca;      //request accelration
    double req_accd;      //request accelration
    double req_start_vel; //request start vel
    double req_stop_vel;  //request stop vel

    //----------------
    double target_vel; //velocity to actually track, limited by other factors
    double finalvel;   //velocity to aim for at end of segment
} STRUCT_SPEED_CTRL;

//初始化
void initial(STRUCT_SPEED_CTRL &vl, double vs, double ve, double vm,
             double a_acc, double d_acc, double target) {
    vl.inter_period = 0.02;
    vl.progress = 0;
    vl.req_start_vel = vs;
    vl.req_stop_vel = ve;
    vl.target_vel = vm;
    vl.req_acca = a_acc;
    vl.req_accd = d_acc;
    vl.target = target;
    vl.current_vel = vl.req_start_vel;
    vl.finalvel = vl.req_stop_vel;
    return;
}

//计算
void spCalculateTrapezoidal(STRUCT_SPEED_CTRL &vl) {
    // Calculations for desired velocity based on trapezoidal profile
    double dx = vl.target - vl.progress;
    double maxaccel = vl.req_acca;
    double discr_term1 = Bl_Square(vl.finalvel);
    double discr_term2 = maxaccel * (2.0 * dx - vl.current_vel * vl.inter_period);
    double tmp_adt = maxaccel * vl.inter_period * 0.5;
    double discr_term3 = Bl_Square(tmp_adt);
    double discr = discr_term1 + discr_term2 + discr_term3;
    double maxnewvel = -tmp_adt;
    if (discr > discr_term3) {
        maxnewvel += sqrt(discr);
    }
    double newvel = blSaturate(maxnewvel, vl.target_vel);
    double dt = vl.inter_period;
    double maxnewaccel = (newvel - vl.current_vel) / dt;
    vl.current_acc = blSaturate(maxnewaccel, maxaccel);
    //计算位置
    double v_next = vl.current_vel + vl.current_acc * vl.inter_period;
    if (v_next < 0) {
        vl.progress = vl.target;
    } else {
        double displacement = (v_next + vl.current_vel) * 0.5 * vl.inter_period;
        vl.progress += displacement;
        if (vl.progress > vl.target) vl.progress = vl.target;
    }
    vl.current_vel = v_next;
    return;
}

//测试启动速度0，停止速度0，存在加速、匀速、减速
void test1(FILE *fd, double &t) {
    STRUCT_SPEED_CTRL vl;
    initial(vl, 25, 5, 10, 5, 5, 300);
    while (1) {
        t += 0.02;
        spCalculateTrapezoidal(vl);
        fprintf(fd, "%f %f %f %f\n", t, vl.progress, vl.current_vel, vl.current_acc);
        if (vl.progress >= vl.target) break;
    }
    return;
}

//启动速度为0，停止速度3，存在加速、匀速、减速
void test2(FILE *fd, double &t) {
    STRUCT_SPEED_CTRL vl;
    initial(vl, 0, 3, 10, 1, 1, 150);
    while (1) {
        t += 0.02;
        spCalculateTrapezoidal(vl);
        fprintf(fd, "%f %f %f %f\n", t, vl.progress, vl.current_vel, vl.current_acc);
        if (vl.progress >= vl.target) break;
    }
    return;
}

//所有速度相同
void test3(FILE *fd, double &t) {
    STRUCT_SPEED_CTRL vl;
    initial(vl, 10, 10, 10, 1, 1, 150);
    while (1) {
        t += 0.02;
        spCalculateTrapezoidal(vl);
        fprintf(fd, "%f %f %f %f\n", t, vl.progress, vl.current_vel, vl.current_acc);
        if (vl.progress >= vl.target) break;
    }
    return;
}

//末端不减速
void test4(FILE *fd, double &t) {
    STRUCT_SPEED_CTRL vl;
    initial(vl, 2, 10, 10, 1, 1, 150);
    while (1) {
        t += 0.02;
        spCalculateTrapezoidal(vl);
        fprintf(fd, "%f %f %f %f\n", t, vl.progress, vl.current_vel, vl.current_acc);
        if (vl.progress >= vl.target) break;
    }
    return;
}

//启动不加速
void test5(FILE *fd, double &t) {
    STRUCT_SPEED_CTRL vl;
    initial(vl, 10, 1, 10, 1, 1, 150);
    while (1) {
        t += 0.02;
        spCalculateTrapezoidal(vl);
        fprintf(fd, "%f %f %f %f\n", t, vl.progress, vl.current_vel, vl.current_acc);
        if (vl.progress >= vl.target) break;
    }
    return;
}

int main() {
    FILE *fd;
    double t = 0;
    fd = fopen("a.dat", "w+");
    test1(fd, t);
    // test5(fd, t);
    return 0;
}