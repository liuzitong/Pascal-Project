unit pubpas;

interface

uses Types;

type
  TReport = packed record
    ReportID: Byte;
    Bytes: array [0..63] of Byte;
  end;

type
  TServer2Lower=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    dotcon:byte;  //3    0xc1��0x00�� �̼�������
    da:array[1..2] of Byte;  //4,5   ����DBֵ��Ӧ��ADֵ,���ֽ���ǰ
    xcoord:byte;  //6   X����1-24
    rcoord:byte;  //7  R����1-20
    gcoord:byte;  //8  G����1-20
    stimtime:array[1..2] of Byte;  //word;  //9,10 10-11λ��Ҫ��̼�������ʱ�䣬��λΪ����  ���ֽ���ǰ����Χ0-2000���� ���Ϊ0xff  0xff ��������������
    gillcon:byte; //11  0xc2��0x00��  ���е������
    gillup:byte;  //12  �϶�0xff
    gilldown:byte;  //13  �¶�0xff
    gillleft:byte;  //14  ��0xff
    gillright:byte;  //15  �Ҷ�0xff
    cameracon:byte;  //16   0xc3��0x00�� ����ͷ��Դ����
    cameraonoff:byte; // 17  ��Դ��0xff  ��Դ��0x00
    otherlamp:byte;  //18  0xc4��0x00�� ���������� ��ִ�з�0x00
    fixlamp:array[1..9] of Byte;  //19-27   ���ӵ�1-9   ��ֵ1-255
    Infraredlamp:array[1..4] of Byte; //28-31   �����1-4   ��ֵ1-255
    backlamp:array[1..3] of Byte; //32-34   ������R   ������G  ������B   ��ֵ1-255
    lowerstatus:byte;  //35   0xc5��0x00��Ҫ����λ������״̬
    lowerbuzy:byte; //36   �践��0xff  ���践��0x00  æ״̬
    lowerserial:byte;  //37  �践��0xff  ���践��0x00   Ӳ�������
    answer:byte;  //  38  ��Ӧ��״̬  �践��0xff  ���践��0x00
    glasspos:byte;  // 39   ����״̬  �践��0xff  ���践��0x00
    envlight1:byte;  // 40  ������1   �践��0xff  ���践��0x00
    envlight2:byte;  // 41  ������2   �践��0xff  ���践��0x00
    envtemper:byte;  //42  �����¶�   �践��0xff  ���践��0x00
    eyeleft:byte;  //43  ����λ       �践��0xff  ���践��0x00
    eyeright:byte;  //44  ����λ      �践��0xff  ���践��0x00
    motorlimit:byte; //45  �����λ״̬   �践��0xff  ���践��0x00
    savedata:byte;  // 46 �洢����        �践��0xff  ���践��0x00
    backup:array[1..15] of Byte;  // 47��61�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;
{
0XAA  0X0F  0XEE  0XC7    0X??  0X??  0X??   0X??   0X??   0X??
     ֡ͷ       ������� ��    ���1����λ����         ����
0X??  0X??   0X??  0X??   0X??  0X??  0X??   0X??  0X??    0X??
���2����λ����       ����    ���3����λ����       ��   ��
0X??  0X??   0X??  0X??   0X??  0X??  0X??   0X??  0X??    0X??
���4����λ����       ����    ���5����λ����       ��   ��
0X??  0X??   0X??  0X??  0X??   0X??   0X00   0X00  0X00    0X00
���6����λ����       �� ��ɫ  ��� --------------------------

0X00  0X00   0X00  0X00  0X00  0X00  0X00   0X00  0X00    0X00
--------------------------------����--------------------------
0X00  0X00   0X00  0X00  0X00  0X00  0X00   0X00  0X00    0X00
 -------------------------------------------------------------
0X00   0X00  0X4E  0X4F
}
type            //Ͷ���
  TServer2LowerTs=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc7 �������
    motor1:array[1..5] of Byte;
//���˳��Ϊ���۽��������ɫ�����DB���������ߵ����DB�������X�����y��������ŵ��
//��һλ������λ�����壺0X00Ϊ�����ƣ�0X11Ϊ˳ʱ��ת��0X22Ϊ��ʱ��ת��0X33Ϊ��λ������Զ��ظ�����翪��λ�ü�0�����λ�ã�
//�ڶ���������λ��ת�ĽǶ�λ�����ʾ����ֵ��λ��ǰ������ÿ��1.8�ȵĲ������ת360��Ҫ200�����壬������Ϊ128ϸ����ת360��Ҫ25600�����壬
//ÿ���������0.0140625�ȣ����Ҫ���ת30�Ⱦ�������ֵΪ2133�����壨ʮ�����Ʊ�ʾ0x00 0x08 0x55��;���Ҫ���ת1440�Ⱦ�������ֵΪ102400�����壨ʮ�����Ʊ�ʾ0x01 0x90 0x00����
    motor2:array[1..5] of Byte;
    motor3:array[1..5] of Byte;
    motor4:array[1..5] of Byte;
    motor5:array[1..5] of Byte;
    motor6:array[1..5] of Byte; //-33
    color:byte;  //34  Э��35λΪ ��ɫ ����ֵ��Χʮ����1��5
    size:byte;   //35  Э��36λΪ ��� ����ֵ��Χʮ����1��6
    stimmode:byte; //36 Э��37λΪ ���ŷ�ʽ��88��ʾ���ú�����λ����ʱ��
    stimtime:array[1..2] of byte; //37 Э��38-39λΪ ����ʱ��
    backup:array[1..23] of Byte;  //38-61  40��62�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type            //Ͷ���,ɨ����
  TServer2LowerTsMove=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc8 ɨ������
    motorx:array[1..3] of Byte;
    motory:array[1..3] of Byte;
    motorspd:array[1..2] of Byte;
    motorjjstep:Byte; //12  ����ֶ���
    motorjj:array[1..10,1..3] of Byte;  //13-42
    backup:array[1..19] of Byte;  //43-61  44��62�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type            //Ͷ���,ɨ���ߣ��ֶ�����ͷ
  TServer2LowerTsMove10H=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc8 ɨ������
    motords:byte;  //4  ����
    motorspd:array[1..2] of Byte; //5,6//�ٶ�
    motorxa:Byte;  //7 x����
    motorya:Byte;  //8����
    backup:array[1..53] of Byte;  //9-61  10��62�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type            //Ͷ���,ɨ����,�ֶ���������
  TServer2LowerTsMove10N=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    motorcon:byte;  //3    0xc8 ɨ������
    motordata:array[1..57] of Byte;  //3-59  4��60�ֽ�  Ϊ����
    addcs:byte;  //�ۼӴ���
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type
  TLower2Server=record
    head:array[1..3] of Byte;  //0,1,2  0xaa 0xf0 0xee 1��3��usbͨ��ʶ��֡ͷ
    lowerbuzy:byte; //3  æ0xff ��æ0x11
    lowerserialhard:array[1..2] of Byte;  //4��5  5��6 ��Ӳ����
    lowerserialsoft:array[1..2] of Byte;  //6��7  7��8�������
    answer:byte;  //  8 ����ȥ0xff  û��0x11
    answertime:array[1..2] of Byte; //9-10 �����̼� ��ķ�Ӧʱ�� ��λ����
    glasspos:byte;  // 11  ����״̬ ̧������0xff  ����ȥ��0x11
    eyeleft:byte;  //12  ����λ ��0xff ��0x11
    eyeright:byte;  //13  ����λ  ��0xff ��0x11
    envlight1:array[1..2] of Byte;  //14��15  15��16�ǻ�����1��ֵ
    envlight2:array[1..2] of Byte;  //16��17   17��18�ǻ�����2��ֵ
    envtemper:array[1..2] of Byte;  //18,19  �����¶�
    motorlimit:array[1..10] of byte; //20-29  �����λ��λ1-10  ��0xff ��0x11
    moveanswerx:array[1..2] of byte;  //30-31 X����
    moveanswery:array[1..2] of byte;  //32-33 Y����
    moveanswerds:byte;  //34 ����
    moveanswerjj:array[1..3] of byte;  //35-37 ���෽�򼰲���
    backup:array[1..24] of Byte;  //38-61 31��62�ֽ�Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63  0xe4  0xf4  63��64�ǽ���֡��

  end;

////////�޸�
type
  TSAVEDATABD=record
    DEVTYPE:word; //0-1  0 ����0x8800  1Ͷ�� 0x0088
    SerialNo:word;  //2-3  ���ţ��������
    DEVID: Cardinal;  //4-7  ������
    VERSION: word;  //8-9 �汾��
    DOT_DA:array[1..2, 1..24, 1..20, 0..40] of word;  			 //0-78719                        //��ɫ �� �� (0db, 40db)
    FOUCUS_DA:array[0..8] of word;
    BACK_DA:array[0..1,0..2] of word;
    HW_DA:array[0..3] of word;
    HJG_DA:word;
    DoubleRate:word;
    EYEMOVE: word;
    EYEGRAY: word;
    EvTemp: word;
    DB90:array[0..45] of word; //90��˥����������0��Ϊ������DB��*50�洢�����2�ȣ�0-45
    DBTemp:array[0..45] of word; //�¶�˥����������0��Ϊ������DB��*50�洢�����1�ȣ�0-45
    SBID: Cardinal;  //4-7  �豸���
    DJ_CS:array[1..2,1..17] of word; // �����������
    EYEGRAYH: word; //�Ʊ�������ֵ
    HJG_DAH: word;  //�Ʊ����⻷���ⱨ��ֵ    
  end;

////////�½�
type
  TSAVEDATATS=record        //3306byte
    DEVTYPE:word; //0-1  0 ����0x8800  1Ͷ�� 0x0088
    SerialNo:word;  //2-3  ���ţ��������
    DEVID: Cardinal;  //4-7  �豸���
    VERSION: word;  //8-9 �汾��
    FOUCUS_DA:array[0..8] of word;  //10-27 ����
    BACK_DA:array[0..1,0..2] of word; //28-39 ����
    HW_DA:array[0..3] of word; //40-47 ����
    HJG_DA:word;  //48,49 �����ⱨ��ֵ
    TSG_DA:word;  //50,51  Ͷ���ǿ������ֵԤ��
    KM2C:word; //52,53 ���Ŵ�������
    YS_STEP:array[0..5] of word;  //54-65 0,��ȫͨ�� 1-5������ɫ�еĸ�����ɫ�����Ӧ�ĵ��ת������
    GB_STEP:array[0..7] of word;  //66-81 0,��ȫͨ�� 1-7���ֹ���еĸ������������õĵ��ת������
    JJ2LD:word;  //82,83 ������������λ������Ҫ�ƶ��Ĳ���
  //���µ� smallint ��Ϊ integer ���ȼ�һ��
    X2C:integer;   //84-87 X����ڼ�������ĵ�ʱ���߶��Ĳ���,�Ը�λ�����
    Y2C:integer;   //88,91 Y����ڼ�������ĵ�ʱ���߶��Ĳ���
    X2JZ:integer;  //92,95 ��ǿУ��ʱ X��������߶��Ĳ���,�Ը�λ�����
    Y2JZ:integer;  //96,99 ��ǿУ��ʱ Y��������߶��Ĳ���
    JZJJ:word;  //100,101 ��ǿУ��ʱ �����������߶��Ĳ���
    X2LX:integer;   //102-105 �����������ĵ����ʱX��������߶��Ĳ���
    Y2LX:integer;  //106-109  �����������ĵ����ʱY��������߶��Ĳ���
    LXJJ:word;  // 110-111�������ĵ�ʱ �����������߶��Ĳ���
    JJ_FW:array[0..1] of word; //112-115 �������ĵ���������Χ,�Ӹ�λλ�ÿ�ʼ����
    JJ_STEP:array[1..7,1..25] of word;  //����������ߣ����룩��Ӧ�������Ӹ�λλ�ÿ�ʼ����
    DB_STEP:array[0..1,0..51] of word; // dB��Ӧ����ɫ����ʹ�С�������ת���Ĳ���
    EYEGRAY: word;
    EvTemp: word;
    X2CF:integer;   //�����ĵ�������X�������
    Y2CF:integer;   //�����ĵ�������Y�������
    SBID: Cardinal;  //4-7  �豸���
    DJ_CS:array[1..8,1..17] of word; // �����������
    EYEGRAYH: word; //�Ʊ�������ֵ
    HJG_DAH: word;  //�Ʊ����⻷���ⱨ��ֵ
    DB90:array[0..45] of word; //90��˥����������0��Ϊ������DB��*50�洢�����2�ȣ�0-45
    DBTemp:array[0..45] of word; //�¶�˥����������0��Ϊ������DB��*50�洢�����1�ȣ�0-45
  end;

////////�½�
type
  TSAVEDATAHead=record        //����ͷ
    DEVTYPE:word; //0-1  0 ����0x8800  1Ͷ�� 0x0088
    SerialNo:word;  //2-3  ���ţ��������
    DEVID: Cardinal;  //4-7  �豸���
    VERSION: word;  //8-9 �汾��
  end;

////////�½�
type
  TDEVTESTDATA=record         //Fmain.FormCreate�ж�ȡDevTestSet.dat�õ�
    TIMESPACE: BYTE;
    CtbcTs: WORD;
    XtbcTs: WORD;
    Cz0Ts: WORD;
    Cz40Ts: WORD;
    //Ͷ��ӣ��洢�ڱ��ص�
    XY2STEP: array[-15..15,-15..15] of array[1..3] of Longint; //-2147483648..2147483647 	x,y ��Ӧ��X�������Y����������볤��
    XY2STEP2: array[-15..15,-15..15] of array[1..3] of Longint; //-2147483648..2147483647 	x,y ��Ӧ��X�������Y����������볤��
    JJ_STEPT:array[1..2,1..25] of smallint;  //����ʱx,yλ��
    DoubleRate:byte;
    VERSION: word;  //�汾��
    SAVEPATH: ShortString;  //�洢·��
  end;                                    									 //10080


type
  TPrefer=record
    Maintag:integer;
    Analysis:string[10];
    AnalysisHint:string;
    kbeangle:integer;
    kenangle:integer;
    testnum:integer;
    testStrategy:string[16];
    flashcolor:string[10];
    flashdiam:string[2];
    flashtime:integer;
    breaktime:integer;
    backcolor:string[10];
    backbright:integer;
    testdot:string;
    TestResult:string;
    LorR: string[5];
    BAnswer: integer;
    BTest: integer;
    Dqbd: single;  //���ڲ���  sc=���ȱ��
    Pjqs: single; //ƽ��ȱ��  SC=����ȱ��
    TestPjz: single;  //ƽ��������
    TestDateTime: TDateTime;
    TestTime: string[6];
    JyjcNum:integer; //�����Լ���
    JyydNum:integer; //������Ӧ���
    JsjcNum:integer; //�����Լ���
    JsydNum:integer; //������Ӧ���
    TestDb:integer;  //screen test use db
    ReportMs:byte; //���浥ģʽ
    xxdb1: single;  //����db
    xxdb2: single;  //����db
    xxdb3: single;  //����db
    xxdb4: single;  //����db
end;

type
  tdata=record
    x:integer;              //�����x,y����ֵ,��democheckdata.pt��ֵ
    y:integer;
    db:integer;              //�����ǵ�һ�����Ƶ���ֵ,��ʼֵ����Ϊ0,��democheckdata��ֵ,��4��������һ����ֵ
    arr:boolean;             //��ʼֵΪtrueӦ�ñ�ʾָû���Եĵ� falseӦ�����Ѿ������˵ĵ�
    oren:byte;                //��ʼֵΪ0 ��DelYDQK�б���ֵ
    isxy4:boolean;             //��ʼֵΪfalse,getXy4����4����Ϊtrue
    arrtime:integer;           //����?    ��ʼֵΪ4
    DBlow,DBmid,DBhigh:byte;   //Ԥ��DB�ķ�Χ DBmid ��ʼֵΪ0
end;

type
  TPatient = record
     Id:string;
     name:string[10];   //����
     sex:string[2];     //�Ա�
     age:string[3];     //����
     birthdate:string[10];
     eyesight:string;     //����
     eyepower:string;  //��ѹ
     eyediam:string;  //ֱ��
end;

type T5MotorArr=array[0..5] of integer;
type T10JJMotorArr=array[0..10] of integer;
type T10MotorArr=array[0..4,0..10] of integer;  //jj,x,y����ֶβ���,x,y�ֶ�λ������X10

type
  newtdatarray = array of tdata;
  TDataArray = array of array of Single;
  PInteger = ^Integer;
  TIntArray = array of integer;
  TMDArray = array[0..56,0..1] of byte;
  TYCArray = array[0..23,0..1] of single;

  var
    Server2Lower:TServer2Lower;
    Server2LowerTs:TServer2LowerTs;
    Server2LowerTsMove:TServer2LowerTsMove;
    Server2LowerTsMove10H:TServer2LowerTsMove10H;
    Server2LowerTsMove10N:TServer2LowerTsMove10N;


    Lower2Server:TLower2Server;
    SaveDataBd:TSAVEDATABD;         //���� ��TFMain.TimerInitTimer->ButtonInitClick-> ReadDevData ��ʼ����
    SaveDataTs:TSAVEDATATS;       //Ͷ��
    SaveDataHead:TSAVEDATAHead;   //Ӳ��   ��TFMain.TimerInitTimer->ButtonInitClick->ButtonReadHeadClick ��ʼ����
    SaveDataHeadLocal:TSAVEDATAHead; //����
    OldPoint: TPoint;
    OldDB,OldGB,OldColor: byte;
    Old5MotorStep: T5MotorArr;  //�洢��һ��Ͷ��ʱ5������λ��
    OldPId: integer;
    changeparm: boolean;

    Old4XY: boolean;
    priXYFW,priXYFWF: boolean;
    T100msCount:integer;

    pubmovearr: T10MotorArr;
    pubanswerxy,pubanswerxystep:TPoint;

    pubMotoBuzy: boolean; //���״̬ æ����
    pubblindon: boolean;  //ä��
    pubtestover: boolean;
    pubKmOpen: boolean; //������
    pubCurZbx: byte;  //1,2����ϵͳ

    pubmoveline: boolean; //ɨ��
    pubmoveend: boolean;  //��ɨ�����
    pubmoveanswer: boolean; //ɨ��Ӧ��
    pubmovebackx,pubmovebacky,pubmovebackjj,pubmovexfx,pubmoveyfx: integer;
    pubmovexstep,pubmoveystep,pubmovejjstep: integer;

    DevTestData:TDEVTESTDATA;
    ExeFilePath:string;

    USBReadbuf:array[0..10240] of byte;

    USBDataBuf:array[0..102400] of byte;

    USBDataBufXj:array[0..102400] of byte;

    ////////
    A: TDataArray;
    pubqdcx: string;
    pubgbqd: boolean;
    pubYhdw,pubKorFstr: string;
    pubKorF: integer;
    pubPatient: TPatient;
    pubPrefer: TPrefer;
    pubMaintag: integer;
    pubblindx,pubblindy,pubblinddb: Byte;

    pubkey: boolean;
    pubkey1: boolean;
    publevel: Byte;       // =0 �²��� ��1 VIEW  ��2 ѡ���ز�
    pubQdms: Byte;      //=0 �Զ�ȡ�� ��1 �ӿ�ȡ�� ��2 ����ȡ��
    pubDub: boolean;  //�Ƿ��Ѳ�˫��
    pubSave: boolean;
    pubResW: byte;  //1������һ�ۣ�2������
    pubLoad,pubLoadDb: boolean;
    pubZrfs: byte;  //1-��������, 2-FMAN ����
    pubZdpz,pubResultDb: string;
    pubDbTime: TDateTime;

    pubProjId: integer;
    pubxx1,pubxx2,pubxx3,pubxx4: boolean;  //����ѡ��
    pubhastest: integer;                    //�Ѿ������˵ĵ�
    pubbackon: boolean;

    My_top_db:integer;
    beep:boolean;  //07.9.16�޸ģ���ҳ����ʱĬ������Ϊfalse����Ĭ�ϲ�����

    publight,pubAnswer,pubAnswStop,pubHjg:boolean;  //true ǿ�� FALSE ����
    pubmovspid: byte; //1--9    �ƶ��ٶ�
    pubshowgray: boolean;  //�Ҷ���ʾ
    pubEyeMoveYN: boolean;

    oldglass: byte;


    pmoverstrstep,pmovelstrstep: string;

    pmaxdb: integer;
    //////
    pubentertest: boolean;
    pubentertestmode: byte;   //�����鷽ʽ 0 main  1 new 2 doc
    pubcurid: string;

    prikey,pritesting,pubgets:boolean; //pubgets��ȡӲ��״̬,showread��false.

    pubhjgda: integer;

    pubMoveTestSend: boolean; //

implementation


end.
