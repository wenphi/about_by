#include "test_motion.hpp"
#include "error/emc_error.hpp"
#include "log/log.hpp"
#include <chrono>

using namespace COMMON;
using namespace MODULES::MOTION;

bool TestMotion::configureHook()
{
    if (m_motion != nullptr)
    {
        EMC_LOG(m_log, Log_Debug, MOTION_DEBUG_CONFIG) << "success configureHook";
        return true;
    }
    EMC_LOG(m_log, Log_Fatal, MOTION_FATAL_HOOK_CONFIG_FAILED) << "faild configureHook";
    return false;
}

void TestMotion::testPathP2P_Posit()
{
    UserOvl_t ovl = {1.0, 0, 0};
    switch (ms6_cnt)
    {
    case 0:
        aim_posit.arm_joint[0] = 2.0;
        aim_posit.arm_joint[1] = -1;
        aim_posit.arm_joint[2] = 80.0;
        aim_posit.arm_joint[3] = 2;
        m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, ms6_cnt);
        break;
    case 1:
        aim_posit.arm_joint[0] = -2.0;
        aim_posit.arm_joint[1] = 2;
        aim_posit.arm_joint[2] = 0.0;
        aim_posit.arm_joint[3] = -1;
        m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, ms6_cnt);
        break;
    case 2:
        aim_posit.arm_joint[0] = 1.0;
        aim_posit.arm_joint[1] = 0;
        aim_posit.arm_joint[2] = 90.0;
        aim_posit.arm_joint[3] = 0;
        m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, ms6_cnt);
        break;
    case 3:
        ovl.rel = 0;
        aim_posit.arm_joint[0] = 1;
        aim_posit.arm_joint[1] = 1;
        aim_posit.arm_joint[2] = 0;
        aim_posit.arm_joint[3] = 0;
        m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, ms6_cnt);
        break;
    case 4:
        aim_posit.arm_joint[0] = 0.0;
        aim_posit.arm_joint[1] = 1.5;
        aim_posit.arm_joint[2] = 50.0;
        aim_posit.arm_joint[3] = -2;
        m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, ms6_cnt);
        break;
    default:
        break;
    }
    return;
}

void TestMotion::testP2P()
{
    bool error = false;
    switch (ms6_cnt)
    {
    case 0:
        aim_posit.arm_joint[0] = 2.0;
        aim_posit.arm_joint[1] = -1;
        aim_posit.arm_joint[2] = 80.0;
        aim_posit.arm_joint[3] = 2;
        break;
    case 1:
        aim_posit.arm_joint[0] = -2.0;
        aim_posit.arm_joint[1] = 2;
        aim_posit.arm_joint[2] = 0.0;
        aim_posit.arm_joint[3] = -1;
        break;
    case 2:
        aim_posit.arm_joint[0] = 1.0;
        aim_posit.arm_joint[1] = 0;
        aim_posit.arm_joint[2] = 90.0;
        aim_posit.arm_joint[3] = 0;
        break;
    case 3:
        aim_posit.arm_joint[0] = 0.0;
        aim_posit.arm_joint[1] = 1.5;
        aim_posit.arm_joint[2] = 50.0;
        aim_posit.arm_joint[3] = -2;
        break;
    default:
        error = true;
        break;
    }
    if (!error)
    {
        m_motion->motionAddFreeAllJointAbsMove(vl, aim_posit, 0);
    }

    return;
}

void TestMotion::testP2PRand()
{
    int ret;
    int get_rand;
    double posit1, posit2, posit3, posit4;
    COMMON::nsecs t1;
    t1 = rtos_get_time_ns();
    srand(time(NULL));
    get_rand = rand();
    posit1 = ((get_rand % 40) / 10.0) - 2.0;
    get_rand = rand();
    posit2 = ((get_rand % 30) / 10.0) - 1.5;
    get_rand = rand();
    posit3 = ((get_rand % 1000) / 10.0);
    get_rand = rand();
    posit4 = ((get_rand % 30) / 10.0) - 1.5;
    aim_posit.arm_joint[0] = posit1;
    aim_posit.arm_joint[1] = posit2;
    aim_posit.arm_joint[2] = posit3;
    aim_posit.arm_joint[3] = posit4;
    m_motion->motionAddFreeAllJointAbsMove(vl, aim_posit, id_);
    id_++;
}

void TestMotion::testP2PRandPath()
{
    int ret;
    int get_rand;
    double posit1, posit2, posit3, posit4;
    UserOvl_t ovl;
    COMMON::nsecs t1;
    t1 = rtos_get_time_ns();
    ovl.rel = 0;
    srand(t1);
    get_rand = rand();
    posit1 = ((get_rand % 40) / 10.0) - 2.0;
    get_rand = rand();
    posit2 = ((get_rand % 30) / 10.0) - 1.5;
    get_rand = rand();
    posit3 = ((get_rand % 600) / 10.0) + 60.0;
    get_rand = rand();
    posit4 = ((get_rand % 30) / 10.0) - 1.5;
    aim_posit.arm_joint[0] = posit1;
    aim_posit.arm_joint[1] = posit2;
    aim_posit.arm_joint[2] = posit3;
    aim_posit.arm_joint[3] = posit4;
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, id_);
    id_++;
}

void TestMotion::testLineRandPath()
{
    int ret, k_flag;
    int get_rand;
    double posit1, posit2, posit3, posit4;
    IntePose_t pose;
    UserOvl_t ovl;
    UserVelBase_t cart_vl;
    cart_vl.vel = 500;
    cart_vl.acca = 5000;
    cart_vl.accd = 4000;
    cart_vl.jerk = 0;
    COMMON::nsecs t1;
    t1 = rtos_get_time_ns();
    ovl.rel = 0;
    srand(t1);
    get_rand = rand();
    posit1 = ((get_rand % 50) / 10.0) - 2.5;
    get_rand = rand();
    posit2 = ((get_rand % 40) / 10.0) - 2.0;
    get_rand = rand();
    posit3 = ((get_rand % 1200) / 10.0);
    get_rand = rand();
    posit4 = ((get_rand % 30) / 10.0) - 1.5;
    aim_posit.arm_joint[0] = posit1;
    aim_posit.arm_joint[1] = posit2;
    aim_posit.arm_joint[2] = posit3;
    aim_posit.arm_joint[3] = posit4;
    m_motion->baseForwardKinematicEef(aim_posit, pose, k_flag);
    // m_motion->motionAddPathLineAbsMove(cart_vl, ovl, pose, AUTO_ARM, id_);
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, pose, RIGHT_ARM, id_);
    id_++;
}

void TestMotion::testLineRectangle()
{
    int ret, k_flag;
    int get_rand;
    double posit1, posit2, posit3, posit4;
    IntePose_t pose[4];
    IntePosition_t posit;
    UserOvl_t ovl;
    ovl.rel = 0;
    UserVelBase_t cart_vl;
    cart_vl.vel = 500;
    cart_vl.acca = 5000;
    cart_vl.accd = 4000;
    cart_vl.jerk = 0;
    pose[0].frame.p = KDL::Vector(250, -100, 50);
    pose[0].frame.M = KDL::Rotation::RPY(0, 0, 0);
    pose[1].frame.p = KDL::Vector(250, 100, 50);
    pose[1].frame.M = KDL::Rotation::RPY(0, 0, 0);
    pose[2].frame.p = KDL::Vector(300, 100, 50);
    pose[2].frame.M = KDL::Rotation::RPY(0, 0, 0);
    pose[3].frame.p = KDL::Vector(300, -100, 50);
    pose[3].frame.M = KDL::Rotation::RPY(0, 0, 0);
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, pose[3], LEFT_ARM, id_);
    id_++;
    m_motion->motionAddPathLineAbsMove(cart_vl, ovl, pose[0], LEFT_ARM, id_);
    id_++;
    m_motion->motionAddPathLineAbsMove(cart_vl, ovl, pose[1], LEFT_ARM, id_);
    id_++;
    m_motion->motionAddPathLineAbsMove(cart_vl, ovl, pose[2], LEFT_ARM, id_);
    id_++;
    m_motion->motionAddPathLineAbsMove(cart_vl, ovl, pose[3], LEFT_ARM, id_);
    id_++;

    return;
}

void TestMotion::testP2P_Pose()
{
    IntePose_t pose;
    for (int i = 0; i < MAX_EXT_JOINT_NUM; i++)
    {
        pose.ext_joint[i] = 0.0;
    }
    switch (ms6_cnt)
    {
    case 0:
        pose.frame.p = KDL::Vector(300, 0, 0);
        pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
        break;
    case 1:
        pose.frame.p = KDL::Vector(0, 300, 0);
        pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
        break;
    case 2:
        pose.frame.p = KDL::Vector(0, -300, 0);
        pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
        break;
    case 3:
        pose.frame.p = KDL::Vector(200, 200, 0);
        pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
        break;
    }
    m_motion->motionAddFreeAllJointAbsMove(vl, pose, 0, 0);
    return;
}
void TestMotion::testP2pPoseAddMany()
{
    IntePose_t pose;
    UserVel_t vl;
    UserOvl_t ovl;

    for (int i = 0; i < MAX_EXT_JOINT_NUM; i++)
    {
        pose.ext_joint[i] = 0.0;
    }
    pose.frame.p = KDL::Vector(300, 0, 0);
    pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, pose, 0, id_);
    pose.frame.p = KDL::Vector(0, 300, 0);
    pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, pose, 0, id_);
    pose.frame.p = KDL::Vector(0, -300, 0);
    pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, pose, 0, id_);
    pose.frame.p = KDL::Vector(200, 200, 0);
    pose.frame.M = KDL::Rotation::RPY(0, 0, 0);
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, pose, 0, id_);
    return;
}
void TestMotion::testP2p_posit_Add_Many()
{
    UserOvl_t ovl = {1.0, 0, 0};
    aim_posit.arm_joint[0] = -2;
    aim_posit.arm_joint[1] = -2.5;
    aim_posit.arm_joint[2] = 0;
    aim_posit.arm_joint[3] = 2;
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, id_);
    id_++;
    aim_posit.arm_joint[0] = -1;
    aim_posit.arm_joint[1] = -3;
    aim_posit.arm_joint[2] = 80;
    aim_posit.arm_joint[3] = 0;
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, id_);
    id_++;
    aim_posit.arm_joint[0] = 1;
    aim_posit.arm_joint[1] = 1;
    aim_posit.arm_joint[2] = 80;
    aim_posit.arm_joint[3] = 0;
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, id_);
    id_++;
    ovl.rel = 0;
    aim_posit.arm_joint[0] = 1;
    aim_posit.arm_joint[1] = 2.5;
    aim_posit.arm_joint[2] = 0;
    aim_posit.arm_joint[3] = 0;
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, id_);
    id_++;
    ovl.rel = 0;
    aim_posit.arm_joint[0] = 1;
    aim_posit.arm_joint[1] = 1;
    aim_posit.arm_joint[2] = 0;
    aim_posit.arm_joint[3] = 0;
    m_motion->motionAddPathAllJointAbsMove(vl, ovl, aim_posit, id_);
    id_++;
    return;
}
void TestMotion::testDrag()
{
    static int drag_cnt = 0;
    if (drag_cnt >= 200)
    {
        drag_cnt = 0;
    }
    if (drag_cnt == 0)
    {
        for (int i = 0; i < 4; i++)
        {
            m_motion->motionCmdStartDrag(1, i, 0.05);
        }
    }
    if (drag_cnt == 100)
    {
        for (int i = 0; i < 4; i++)
        {
            m_motion->motionCmdStopDrag(1, i);
        }
    }
    drag_cnt++;
    return;
}

void TestMotion::testSingalJoint()
{
    double posit;
    switch (ms6_cnt)
    {
    case 0:
        posit = 1;
        id_++;
        break;
    case 1:
        posit = -2;
        id_++;
        break;
    case 2:
        posit = 3;
        id_++;
        break;
    case 3:
        posit = 0;
        id_++;
        break;
    default:
        return;
    }
    m_motion->motionAddFreeSingalJointAbs(true, 0, vl, posit, id_);
    return;
}

void TestMotion::updateHook()
{
    EmcError m_e(E_NO_ERROR, "");
    Json::Value value_test;
    Json::Reader reader;
    std::ifstream fi;
    KDL::Frame eef;
    IntePosition_t curr_posit;
    IntePose_t cur_pose;
    int joint_num;
    int i;
    int flg;
    // EMC_LOG(m_log, Log_Debug) << getName() << ": updateHook";
    if (m_motion->motionQueryIsEmergencyStop() && m_sm != 0 && m_sm != 1)
    {
        m_sm = 0;
        cnt = 0;
    }
    switch (m_sm)
    {
    case 0:
        //等待3s，解除急停
        cnt++;
        if (cnt >= 30)
        {
            m_sm = 1;
        }
        break;
    case 1:
        //解除急停
        m_motion->motionCmdEmergencyStopRelease();
        m_motion->motionCmdServoOn();
        m_sm = 2;
        cnt = 0;
        break;
    case 2:
        //等待15s
        cnt++;
        if (cnt >= 150)
        {
            cnt = 0;
            m_sm = 3;
        }
        break;
    case 3:
        cnt = 0;
        //回零
        m_e = m_motion->motionCmdJointHoming(1, 0);
        if (m_e.code != E_NO_ERROR)
        {
            EMC_LOG(m_log, Log_Error, MOTION_DEBUG_DEVICE) << ": "
                                                           << m_e.message;
        }
        m_e = m_motion->motionCmdJointHoming(1, 1);
        if (m_e.code != E_NO_ERROR)
        {
            EMC_LOG(m_log, Log_Error, MOTION_DEBUG_DEVICE) << ": "
                                                           << m_e.message;
        }
        m_e = m_motion->motionCmdJointHoming(1, 2);
        if (m_e.code != E_NO_ERROR)
        {
            EMC_LOG(m_log, Log_Error, MOTION_DEBUG_DEVICE) << ": "
                                                           << m_e.message;
        }
        m_e = m_motion->motionCmdJointHoming(1, 3);
        if (m_e.code != E_NO_ERROR)
        {
            EMC_LOG(m_log, Log_Debug, MOTION_DEBUG_DEVICE) << getName() << ": "
                                                           << m_e.message;
        }
        m_sm = 4;
        break;
    case 4:
        if (m_motion->motionQueryIsAllJointHomed())
        {
            m_e = m_motion->motionCmdChangeFeedRate(0.05);
            if (E_NO_ERROR == m_e.code)
            {
                cnt++;
                if (cnt >= 30)
                {
                    cnt = 0;

                    if (m_e.code != E_NO_ERROR)
                    {
                        EMC_LOG(m_log, Log_Debug, MOTION_DEBUG_CMD) << "error set feed_rate!";
                    }
                    else
                        m_sm = 5;
                }
            }
            else
            {
                EMC_LOG(m_log, Log_Error, MOTION_ERROR_UNDEFINE) << "set feed rate error:";
            }
        }
        break;
    case 5:
        if (m_motion->motionQueryMoveDone())
        {
            m_sm = 6;
            break;
        }
        if (m_motion->motionQueryPathBuffUsedSize() < 5)
        {
            m_sm = 6;
            break;
        }

        break;
    case 6:
        // testSingalJoint();
        // testP2P();
        // testP2PRand();
        // testP2PRandPath();
        // testLineRandPath();
        testLineRectangle();
        // testDrag();
        // testP2P_Pose();
        // testPathP2P_Posit();
        // testP2p_posit_Add_Many();
        // m_sm = 5;
        ms6_cnt++;
        if (ms6_cnt > 4)
        {
            ms6_cnt = 0;
            m_sm = 5;
        }
        break;
    default:
        break;
    }
    return;
}

void TestMotion::stopHook()
{
    //停止所有相关的运动
    m_motion->motionCmdAbort();
    while (!m_motion->motionQueryMoveDone())
    {
        //等待运动完成
        std::this_thread::sleep_for(std::chrono::milliseconds(5));
    }
    return;
}
