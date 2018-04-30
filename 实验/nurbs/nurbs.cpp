#include "component/emc_time.hpp"
#include "motion/tp/tc.hpp"
#include "motion/tp/trajectory_plan.hpp"
#include "component/os/fosi.h"
#include <iostream>
#include <stdio.h>
#include <stdlib.h>

using namespace std;
using namespace KDL;
using namespace joint_control;
using namespace COMMON;

FILE *fd1;
FILE *fd2;
FILE *fd3;
FILE *fd4;
FILE *fd5;
//随意走
void trajectory_run(TrajectoryPlan *trajec)
{
    TP_STRUCT tp;
    TC_STRUCT tc[100];
    trajec->tpInit(&tp, 20, tc, 0.02);
    tp.feed_override = 1;
    fd1 = fopen("a.txt", "w+");
    Frame end;  //直线1,
    Frame end2; //直线2
    Frame end3; //圆弧3
    Vector center, normal;
    end.p = Vector(0, 100, 50);
    end.M = Rotation::RPY(1, 5, 8);
    end2.p = Vector(50, 8, 0);
    end2.M = Rotation::RPY(0, 0, 0);
    end3.p = Vector(6, 7, 90);
    end3.M = Rotation::RPY(0, 0, 5);

    center = Vector(-30, 50, 0);
    normal = Vector(30, 50, 50);

    trajec->tpAddLine(&tp, end, 5, 20, 5, 0, CIRCLE_BLEND, 1e-3, 5);
    trajec->tpAddLine(&tp, end2, 5, 20, 5, 0, CIRCLE_BLEND, 1e-3, 5);
    // trajec->tpAddCircle_3P(&tp,center,end3,1e-5,5,20,10,1);
    // trajec->tpAddCircle_3P(&tp,normal,end3,1e-5,5,20,10,0);
    double count = 0;
    while (1)
    {
        count += 0.02;
        // if(count>=5)    tp.feed_override=0.73869;
        trajec->tpRuncycle(&tp);
        fprintf(fd1, "%.6f %.6f %.6f %.6f %.6f %.6f %.6f\n", count, tp.progress, tp.cur_vel, tp.cur_accel, tp.curpose.p.data[0], tp.curpose.p.data[1], tp.curpose.p.data[2]);
        fflush(fd1);
        cout << count << endl
             << tp.curpose << endl;
        if (tp.done)
            break;
    }
    return;
}
//走一个矩形
void rectangle_run(TrajectoryPlan *trajec)
{
    FILE *get_time;
    TP_STRUCT tp;
    TC_STRUCT tc[100];
    nsecs t_start, t_end;
    nsecs dt, dmax;
    trajec->tpInit(&tp, 20, tc, 0.02);
    get_time = fopen("getTime.txt", "w+");
    fd1 = fopen("a.txt", "w+");
    Frame p1, p2, p3, p4, p5, p6, p7, p8, p9;
    Vector c1, c2, c3, c4, normal;
    p1.p = Vector(50, 50, 0);
    p1.M = Rotation::RPY(0, 0, 0);
    p2.p = Vector(50, 100, 0);
    p2.M = Rotation::RPY(0, 0, 0);
    p3.p = Vector(55, 100, 0);
    p3.M = Rotation::RPY(0, 0, 0);
    p4.p = Vector(100, 100, 0);
    p4.M = Rotation::RPY(0, 0, 0);
    p5.p = Vector(100, 95, 0);
    p5.M = Rotation::RPY(0, 0, 0);
    p6.p = Vector(100, 50, 0);
    p6.M = Rotation::RPY(0, 0, 0);
    p7.p = Vector(95, 50, 0);
    p7.M = Rotation::RPY(0, 0, 0);
    p8.p = Vector(50, 50, 0);
    p8.M = Rotation::RPY(0, 0, 0);
    p9.p = Vector(50, 55, 0);
    p9.M = Rotation::RPY(0, 0, 0);
    c1 = Vector(55, 95, 0);
    c2 = Vector(95, 95, 0);
    c3 = Vector(95, 55, 0);
    c4 = Vector(55, 55, 0);
    normal = Vector(0, 0, 1);
    trajec->tpAddLine(&tp, p1, 5, 20, 10, 0, CIRCLE_BLEND, 1e-5, 1);
    trajec->tpAddLine(&tp, p2, 5, 20, 10, 0, CIRCLE_BLEND, 1e-4, 1);
    // trajec->tpAddCircle_ECN(&tp,p3,c1,normal,1e-3,5,20,10,0);
    trajec->tpAddLine(&tp, p4, 5, 20, 10, 0, CIRCLE_BLEND, 1e-3, 3);
    // trajec->tpAddCircle_ECN(&tp,p5,c2,normal,1e-6,5,20,10,0);
    trajec->tpAddLine(&tp, p6, 5, 20, 10, 0, CIRCLE_BLEND, 1e-2, 4);
    // trajec->tpAddCircle_ECN(&tp,p7,c3,normal,1e-2,5,20,10,0);
    trajec->tpAddLine(&tp, p8, 5, 20, 10, 0, CIRCLE_BLEND, 1e-5, 5);
    // trajec->tpAddCircle_ECN(&tp,p9,c4,normal,1e-1,5,20,10,0);
    double count = 0;
    while (1)
    {
        count += 0.02;
        t_start = rtos_get_time_ns();
        trajec->tpRuncycle(&tp);
        t_end = rtos_get_time_ns();
        dt = t_end - t_start;
        if (dt > dmax)
            dmax = dt;
        fprintf(get_time, "%s %lld %lld\n", "a cycle time=", dt, dmax);
        fflush(get_time);
        fprintf(fd1, "%.6f %.6f %.6f %.6f %.6f %.6f %.6f\n", count, tp.progress, tp.cur_vel, tp.cur_accel, tp.curpose.p.data[0], tp.curpose.p.data[1], tp.curpose.p.data[2]);
        fflush(fd1);
        if (tp.done)
            break;
    }
    fclose(get_time);
    return;
}
//样条曲线测试
void runNurbs(TrajectoryPlan *trajec)
{
    FILE *get_time;
    TP_STRUCT tp;
    TC_STRUCT tc[100];
    nsecs t_start, t_end;
    nsecs dt, dmax;
    int num = 6;
    Frame control_point[num];
    double count;
    double data;
    double nurbs_eps = 1e-3;
    trajec->tpInit(&tp, 100, tc, 0.02);
    fd1 = fopen("a.txt", "w+");
    fd2 = fopen("b.txt", "w+");
    fd3 = fopen("c.txt", "w+");
    fd4 = fopen("d.txt", "w+");
    fd5 = fopen("vel.txt", "w+");
    get_time = fopen("getTime.txt", "w+");
    //初始化设置，添加nurbs曲线需要设置控制点节点空间和权因子
    double u[] = {0, 0, 0, 0, 0.4, 0.8, 1, 1, 1, 1};
    double w[] = {1, 1, 1, 1, 1, 1};
    control_point[0].p = Vector(99, 100, 0);
    control_point[1].p = Vector(200, 33, 50);
    control_point[2].p = Vector(120, 50, 20);
    control_point[3].p = Vector(0, 163, 10);
    control_point[4].p = Vector(145, 190, 0);
    control_point[5].p = Vector(0, 300, 30);
    for (int i = 0; i < num; i++)
    {
        // control_point[i].p=control_point[i].p/10;
        fprintf(fd2, "%.6f %.6f %.6f\n", control_point[i].p.data[0], control_point[i].p.data[1], control_point[i].p.data[2]);
        fflush(fd2);
    }
    //向轨迹规划队列中添加样条曲线
    t_start = rtos_get_time_ns();
    trajec->tpAddNurbs(&tp, control_point, u, w, num, nurbs_eps, 5, 20, 10, 0, NONE_BLEND, 0, 0);
    t_end = rtos_get_time_ns();
    dt = t_end - t_start;
    fprintf(get_time, "%s %lld\n", "culculate time=", dt);
    fflush(get_time);
    tp.curpose = control_point[0];
    dmax = 0;
    while (1)
    {
        count = count + 0.02;
        t_start = rtos_get_time_ns();
        trajec->tpRuncycle(&tp);
        t_end = rtos_get_time_ns();
        dt = t_end - t_start;
        if (dt > dmax)
            dmax = dt;
        fprintf(get_time, "%s %lld %lld\n", "a cycle time=", dt, dmax);
        fflush(get_time);
        fprintf(fd1, "%.6f %.6f %.6f %.6f %.6f %.6f %.6f\n", count, tp.progress, tp.cur_vel, tp.cur_accel, tp.curpose.p.data[0], tp.curpose.p.data[1], tp.curpose.p.data[2]);
        fflush(fd1);
        fprintf(fd3, "%.6f %.6f\n", count, tp.cur_chord_error);
        fflush(fd3);
        fprintf(fd4, "%.6f %.6f\n", count, tp.cur_curvature);
        fflush(fd4);
        data = sqrt(8 * nurbs_eps / tp.cur_curvature);
        fprintf(fd5, "%.6f %.6f\n", count, data);
        fflush(fd5);
        if (tp.done)
            break;
    }
    fclose(get_time);
    return;
}

int main()
{
    TrajectoryPlan *trajec = new TrajectoryPlan();
    // trajectory_run(trajec);
    // rectangle_run(trajec);
    runNurbs(trajec);
    delete trajec;
    return 0;
}
