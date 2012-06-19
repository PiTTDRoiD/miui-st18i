.class public Lcom/android/internal/telephony/SamsungRIL;
.super Lcom/android/internal/telephony/RIL;
.source "SamsungRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/SamsungRIL$1;,
        Lcom/android/internal/telephony/SamsungRIL$ConnectivityHandler;,
        Lcom/android/internal/telephony/SamsungRIL$SamsungDriverCall;
    }
.end annotation


# static fields
.field static final RIL_REQUEST_DIAL_EMERGENCY:I = 0x2720

.field static final RIL_UNSOL_DEVICE_READY_NOTI:I = 0x2b00

.field static final RIL_UNSOL_HSDPA_STATE_CHANGED:I = 0x2b08

.field static final RIL_UNSOL_O2_HOME_ZONE_INFO:I = 0x2aff

.field static final RIL_UNSOL_SAMSUNG_UNKNOWN_MAGIC_REQUEST:I = 0x2b04

.field static final RIL_UNSOL_SAMSUNG_UNKNOWN_MAGIC_REQUEST_2:I = 0x2b03

.field static final RIL_UNSOL_SAMSUNG_UNKNOWN_MAGIC_REQUEST_3:I = 0x2b02

.field static final RIL_UNSOL_STK_SEND_SMS_RESULT:I = 0x2afa


# instance fields
.field private mIsSamsungCdma:Z

.field private mSignalbarCount:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 3
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;II)V

    .line 39
    const-string/jumbo v2, "ro.telephony.sends_barcount"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/SamsungRIL;->mSignalbarCount:Z

    .line 40
    const-string/jumbo v0, "ro.ril.samsung_cdma"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    .line 44
    return-void

    :cond_0
    move v0, v1

    .line 39
    goto :goto_0
.end method

.method static synthetic access$300(Lcom/android/internal/telephony/SamsungRIL;ILandroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/SamsungRIL;->sendPreferedNetworktype(ILandroid/os/Message;)V

    return-void
.end method

.method private sendPreferedNetworktype(ILandroid/os/Message;)V
    .locals 3
    .parameter "networkType"
    .parameter "response"

    .prologue
    .line 1001
    const/16 v1, 0x49

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 1004
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1005
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1007
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SamsungRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    .line 1010
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 1011
    return-void
.end method

.method private startPppdCdmaService(Ljava/lang/String;)Z
    .locals 6
    .parameter "ttyname"

    .prologue
    const/16 v5, 0xa

    const/4 v4, 0x2

    const/4 v1, 0x1

    .line 887
    const-string/jumbo v2, "net.cdma.datalinkinterface"

    invoke-static {v2, p1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 891
    const-string/jumbo v2, "ril.cdma.data_state"

    const-string v3, "1"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    const-string v2, "RILJ"

    const-string v3, "Set ril.cdma.data_state=1, waiting for ril.cdma.data_state=2."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 895
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v5, :cond_1

    .line 896
    const-wide/16 v2, 0x64

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 898
    :goto_1
    const-string/jumbo v2, "ril.cdma.data_state"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v4, :cond_0

    .line 899
    const-string v2, "RILJ"

    const-string v3, "Got ril.cdma.data_state=2, connected."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 918
    :goto_2
    return v1

    .line 895
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 905
    :cond_1
    const/4 v0, 0x1

    :goto_3
    if-ge v0, v5, :cond_3

    .line 906
    const-wide/16 v2, 0x3e8

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 908
    :goto_4
    const-string/jumbo v2, "ril.cdma.data_state"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v4, :cond_2

    .line 909
    const-string v2, "RILJ"

    const-string v3, "Got ril.cdma.data_state=2, connected."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 905
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 915
    :cond_3
    const-string v1, "RILJ"

    const-string v2, "Didn\'t get ril.cdma.data_state=2 timely, aborting."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 916
    const-string/jumbo v1, "ril.cdma.data_state"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    const/4 v1, 0x0

    goto :goto_2

    .line 896
    :catch_0
    move-exception v2

    goto :goto_1

    .line 906
    :catch_1
    move-exception v2

    goto :goto_4
.end method


# virtual methods
.method public dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V
    .locals 5
    .parameter "address"
    .parameter "clirMode"
    .parameter "uusInfo"
    .parameter "result"

    .prologue
    const/4 v4, 0x0

    .line 266
    iget-boolean v1, p0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    if-nez v1, :cond_0

    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 267
    const-string v1, "RILJ"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Emergency dial: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    const/16 v1, 0x2720

    invoke-static {v1, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 269
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 276
    :goto_0
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 277
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 279
    if-nez p3, :cond_1

    .line 280
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 288
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SamsungRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    .line 290
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 291
    return-void

    .line 272
    .end local v0           #rr:Lcom/android/internal/telephony/RILRequest;
    :cond_0
    const/16 v1, 0xa

    invoke-static {v1, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 273
    .restart local v0       #rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 282
    :cond_1
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 283
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 284
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 285
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_1
.end method

.method protected processSolicited(Landroid/os/Parcel;)V
    .locals 10
    .parameter "p"

    .prologue
    const/4 v9, 0x0

    .line 79
    const/4 v1, 0x0

    .line 81
    .local v1, found:Z
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 82
    .local v4, serial:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 84
    .local v0, error:I
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Serial: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/SamsungRIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v3

    .line 91
    .local v3, rr:Lcom/android/internal/telephony/RILRequest;
    if-nez v3, :cond_0

    .line 92
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected solicited response! sn: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    :goto_0
    return-void

    .line 97
    :cond_0
    const/4 v2, 0x0

    .line 99
    .local v2, ret:Ljava/lang/Object;
    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v6

    if-lez v6, :cond_3

    .line 101
    :cond_1
    :try_start_0
    iget v6, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v6, :pswitch_data_0

    .line 211
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unrecognized solicited response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    :catch_0
    move-exception v5

    .line 216
    .local v5, tr:Ljava/lang/Throwable;
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "< "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v8}, Lcom/android/internal/telephony/SamsungRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " exception, possible invalid RIL response"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 220
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_2

    .line 221
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v9, v5}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 222
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v6}, Landroid/os/Message;->sendToTarget()V

    .line 224
    :cond_2
    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto :goto_0

    .line 107
    .end local v5           #tr:Ljava/lang/Throwable;
    :pswitch_0
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 229
    .end local v2           #ret:Ljava/lang/Object;
    :cond_3
    :goto_1
    if-eqz v0, :cond_6

    .line 231
    const/4 v6, -0x1

    if-ne v0, v6, :cond_4

    iget v6, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v7, 0x19

    if-eq v6, v7, :cond_5

    .line 233
    :cond_4
    invoke-virtual {v3, v0, v2}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    .line 234
    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto :goto_0

    .line 108
    .restart local v2       #ret:Ljava/lang/Object;
    :pswitch_1
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 109
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 110
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 111
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 112
    :pswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 113
    :pswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 114
    :pswitch_7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 115
    :pswitch_8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 116
    :pswitch_9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 117
    :pswitch_a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 118
    :pswitch_b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 119
    :pswitch_c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 120
    :pswitch_d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 121
    :pswitch_e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 122
    :pswitch_f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 123
    :pswitch_10
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 124
    :pswitch_11
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 125
    :pswitch_12
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 126
    :pswitch_13
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoiceRegistrationState(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 127
    :pswitch_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 128
    :pswitch_15
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 129
    :pswitch_16
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 130
    :pswitch_17
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 131
    :pswitch_18
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 132
    :pswitch_19
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 133
    :pswitch_1a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 134
    :pswitch_1b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 135
    :pswitch_1c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 136
    :pswitch_1d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 137
    :pswitch_1e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 138
    :pswitch_1f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 139
    :pswitch_20
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCallForward(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 140
    :pswitch_21
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 141
    :pswitch_22
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 142
    :pswitch_23
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 143
    :pswitch_24
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 144
    :pswitch_25
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 145
    :pswitch_26
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 146
    :pswitch_27
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 147
    :pswitch_28
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseDeactivateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 148
    :pswitch_29
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 149
    :pswitch_2a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 150
    :pswitch_2b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 151
    :pswitch_2c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 152
    :pswitch_2d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 153
    :pswitch_2e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 154
    :pswitch_2f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 155
    :pswitch_30
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 156
    :pswitch_31
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 157
    :pswitch_32
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 158
    :pswitch_33
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 159
    :pswitch_34
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 160
    :pswitch_35
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 161
    :pswitch_36
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 162
    :pswitch_37
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 163
    :pswitch_38
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 164
    :pswitch_39
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 165
    :pswitch_3a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseRaw(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 166
    :pswitch_3b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 167
    :pswitch_3c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 168
    :pswitch_3d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 169
    :pswitch_3e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 170
    :pswitch_3f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 171
    :pswitch_40
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 172
    :pswitch_41
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 173
    :pswitch_42
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 174
    :pswitch_43
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 175
    :pswitch_44
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 176
    :pswitch_45
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 177
    :pswitch_46
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 178
    :pswitch_47
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 179
    :pswitch_48
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 180
    :pswitch_49
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseNetworkType(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 181
    :pswitch_4a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCellList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 182
    :pswitch_4b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 183
    :pswitch_4c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 184
    :pswitch_4d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 185
    :pswitch_4e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 186
    :pswitch_4f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 187
    :pswitch_50
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 188
    :pswitch_51
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 189
    :pswitch_52
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 190
    :pswitch_53
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 191
    :pswitch_54
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 192
    :pswitch_55
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 193
    :pswitch_56
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 194
    :pswitch_57
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseGmsBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 195
    :pswitch_58
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 196
    :pswitch_59
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 197
    :pswitch_5a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCdmaBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 198
    :pswitch_5b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 199
    :pswitch_5c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 200
    :pswitch_5d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 201
    :pswitch_5e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCdmaSubscription(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 202
    :pswitch_5f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 203
    :pswitch_60
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 204
    :pswitch_61
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 205
    :pswitch_62
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 206
    :pswitch_63
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 207
    :pswitch_64
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 208
    :pswitch_65
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_1

    .line 209
    :pswitch_66
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v2

    goto/16 :goto_1

    .line 239
    .end local v2           #ret:Ljava/lang/Object;
    :cond_5
    :try_start_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v2

    .line 251
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "< "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v7}, Lcom/android/internal/telephony/SamsungRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {p0, v7, v2}, Lcom/android/internal/telephony/SamsungRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    .line 254
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v6, :cond_7

    .line 255
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v6, v2, v9}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 256
    iget-object v6, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v6}, Landroid/os/Message;->sendToTarget()V

    .line 259
    :cond_7
    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto/16 :goto_0

    .line 240
    :catch_1
    move-exception v5

    .line 241
    .restart local v5       #tr:Ljava/lang/Throwable;
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "< "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v8}, Lcom/android/internal/telephony/SamsungRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " exception, Processing Samsung SMS fix "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 244
    invoke-virtual {v3, v0, v2}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    .line 245
    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto/16 :goto_0

    .line 101
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_32
        :pswitch_33
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_38
        :pswitch_39
        :pswitch_3a
        :pswitch_3b
        :pswitch_3c
        :pswitch_3d
        :pswitch_3e
        :pswitch_3f
        :pswitch_40
        :pswitch_41
        :pswitch_42
        :pswitch_43
        :pswitch_44
        :pswitch_45
        :pswitch_46
        :pswitch_47
        :pswitch_48
        :pswitch_49
        :pswitch_4a
        :pswitch_4b
        :pswitch_4c
        :pswitch_4d
        :pswitch_4e
        :pswitch_4f
        :pswitch_50
        :pswitch_51
        :pswitch_52
        :pswitch_53
        :pswitch_54
        :pswitch_5d
        :pswitch_55
        :pswitch_56
        :pswitch_57
        :pswitch_58
        :pswitch_59
        :pswitch_5a
        :pswitch_5b
        :pswitch_5c
        :pswitch_5e
        :pswitch_5f
        :pswitch_60
        :pswitch_61
        :pswitch_64
        :pswitch_62
        :pswitch_63
        :pswitch_65
        :pswitch_66
    .end packed-switch
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 29
    .parameter "p"

    .prologue
    .line 299
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v18

    .line 301
    .local v18, response:I
    sparse-switch v18, :sswitch_data_0

    .line 351
    :try_start_0
    new-instance v24, Ljava/lang/RuntimeException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Unrecognized unsol response: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v24
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 353
    :catch_0
    move-exception v23

    .line 354
    .local v23, tr:Ljava/lang/Throwable;
    const-string v24, "RILJ"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Exception processing unsol response: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "Exception:"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 681
    .end local v23           #tr:Ljava/lang/Throwable;
    :cond_0
    :goto_0
    return-void

    .line 308
    :sswitch_0
    :try_start_1
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v20

    .line 359
    :goto_1
    sparse-switch v18, :sswitch_data_1

    goto :goto_0

    .line 362
    :sswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v24

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->getRadioStateFromInt(I)Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v11

    .line 363
    .local v11, newState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    invoke-virtual {v11}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogMore(ILjava/lang/String;)V

    .line 365
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/internal/telephony/SamsungRIL;->switchToRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    goto :goto_0

    .line 309
    .end local v11           #newState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    :sswitch_2
    :try_start_2
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .local v20, ret:Ljava/lang/Object;
    goto :goto_1

    .line 310
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_3
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 311
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_4
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 312
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_5
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 313
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_6
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 314
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_7
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 315
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_8
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 316
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_9
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 317
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_a
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 318
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_b
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseSuppServiceNotification(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 319
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_c
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 320
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_d
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 321
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_e
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 322
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_f
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 323
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_10
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 324
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_11
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 325
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_12
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCallRing(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 326
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_13
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto :goto_1

    .line 327
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_14
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 328
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_15
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCdmaSms(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 329
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_16
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 330
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_17
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 331
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_18
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 332
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_19
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCdmaCallWaiting(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 333
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_1a
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 334
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_1b
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseCdmaInformationRecord(Landroid/os/Parcel;)Ljava/util/ArrayList;

    move-result-object v20

    .local v20, ret:Ljava/util/ArrayList;
    goto/16 :goto_1

    .line 335
    .end local v20           #ret:Ljava/util/ArrayList;
    :sswitch_1c
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseRaw(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .local v20, ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 336
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_1d
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 337
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_1e
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 338
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_1f
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 343
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_20
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 344
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_21
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 345
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_22
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 346
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_23
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 347
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_24
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 348
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_25
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/SamsungRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v20

    .restart local v20       #ret:Ljava/lang/Object;
    goto/16 :goto_1

    .line 368
    .end local v20           #ret:Ljava/lang/Object;
    :sswitch_26
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 370
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCallStateRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v28}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 374
    :sswitch_27
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 376
    check-cast v20, [I

    check-cast v20, [I

    const/16 v24, 0x0

    aget v24, v20, v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_2

    const/4 v10, 0x1

    .line 377
    .local v10, newHsdpa:Z
    :goto_2
    const-string v24, "gsm.network.type"

    invoke-static/range {v24 .. v24}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 378
    .local v6, curState:Ljava/lang/String;
    const/4 v5, 0x0

    .line 380
    .local v5, curHsdpa:Z
    const-string v24, "HSDPA:9"

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_3

    .line 381
    const/4 v5, 0x1

    .line 387
    :cond_1
    if-eq v5, v10, :cond_0

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mVoiceNetworkStateRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v28}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 376
    .end local v5           #curHsdpa:Z
    .end local v6           #curState:Ljava/lang/String;
    .end local v10           #newHsdpa:Z
    :cond_2
    const/4 v10, 0x0

    goto :goto_2

    .line 382
    .restart local v5       #curHsdpa:Z
    .restart local v6       #curState:Ljava/lang/String;
    .restart local v10       #newHsdpa:Z
    :cond_3
    const-string v24, "UMTS:3"

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_1

    goto/16 :goto_0

    .line 394
    .end local v5           #curHsdpa:Z
    .end local v6           #curState:Ljava/lang/String;
    .end local v10           #newHsdpa:Z
    :sswitch_28
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 396
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mVoiceNetworkStateRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v28}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 400
    :sswitch_29
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 403
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v4, v0, [Ljava/lang/String;

    .line 405
    .local v4, a:[Ljava/lang/String;
    const/16 v24, 0x1

    check-cast v20, Ljava/lang/String;

    aput-object v20, v4, v24

    .line 409
    invoke-static {v4}, Landroid/telephony/SmsMessage;->newFromCMT([Ljava/lang/String;)Landroid/telephony/SmsMessage;

    move-result-object v21

    .line 410
    .local v21, sms:Landroid/telephony/SmsMessage;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mGsmSmsRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mGsmSmsRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v21

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 417
    .end local v4           #a:[Ljava/lang/String;
    .end local v21           #sms:Landroid/telephony/SmsMessage;
    :sswitch_2a
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 419
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSmsStatusRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 420
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSmsStatusRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 425
    :sswitch_2b
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 427
    check-cast v20, [I

    move-object/from16 v22, v20

    check-cast v22, [I

    .line 429
    .local v22, smsIndex:[I
    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v24, v0

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_4

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSmsOnSimRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSmsOnSimRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v22

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 435
    :cond_4
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, " NEW_SMS_ON_SIM ERROR with wrong length "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    goto/16 :goto_0

    .end local v22           #smsIndex:[I
    :sswitch_2c
    move-object/from16 v24, v20

    .line 440
    check-cast v24, [Ljava/lang/String;

    move-object/from16 v17, v24

    check-cast v17, [Ljava/lang/String;

    .line 442
    .local v17, resp:[Ljava/lang/String;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v24, v0

    const/16 v25, 0x2

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_5

    .line 443
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    .line 444
    const/16 v24, 0x0

    check-cast v20, [Ljava/lang/String;

    check-cast v20, [Ljava/lang/String;

    const/16 v25, 0x0

    aget-object v25, v20, v25

    aput-object v25, v17, v24

    .line 445
    const/16 v24, 0x1

    const/16 v25, 0x0

    aput-object v25, v17, v24

    .line 447
    :cond_5
    const/16 v24, 0x0

    aget-object v24, v17, v24

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogMore(ILjava/lang/String;)V

    .line 448
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mUSSDRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mUSSDRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v17

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 454
    .end local v17           #resp:[Ljava/lang/String;
    :sswitch_2d
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 458
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v13

    .line 460
    .local v13, nitzReceiveTime:J
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    .local v19, result:[Ljava/lang/Object;
    move-object/from16 v12, v20

    .line 462
    check-cast v12, Ljava/lang/String;

    .line 463
    .local v12, nitz:Ljava/lang/String;
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, " RIL_UNSOL_NITZ_TIME_RECEIVED length = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "[/:,+-]"

    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    .line 467
    const-string v24, "[/:,+-]"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    const/16 v25, 0x9

    move/from16 v0, v24

    move/from16 v1, v25

    if-lt v0, v1, :cond_6

    .line 468
    const/16 v24, 0x0

    const-string v25, ","

    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 469
    :cond_6
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, " RIL_UNSOL_NITZ_TIME_RECEIVED striped nitz = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    .line 471
    const/16 v24, 0x0

    aput-object v12, v19, v24

    .line 472
    const/16 v24, 0x1

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v19, v24

    .line 474
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mNITZTimeRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_7

    .line 476
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mNITZTimeRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v19

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 480
    :cond_7
    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/internal/telephony/SamsungRIL;->mLastNITZTimeInfo:Ljava/lang/Object;

    goto/16 :goto_0

    .line 489
    .end local v12           #nitz:Ljava/lang/String;
    .end local v13           #nitzReceiveTime:J
    .end local v19           #result:[Ljava/lang/Object;
    :sswitch_2e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSignalStrengthRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 490
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSignalStrengthRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 495
    :sswitch_2f
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 497
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mDataNetworkStateRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 501
    :sswitch_30
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 503
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSsnRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 504
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mSsnRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 510
    :sswitch_31
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 512
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatSessionEndRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 513
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatSessionEndRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 519
    :sswitch_32
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 521
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatProCmdRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 522
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatProCmdRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 528
    :sswitch_33
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatEventRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 531
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatEventRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 537
    :sswitch_34
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 539
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatCallSetUpRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 540
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCatCallSetUpRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 546
    :sswitch_35
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 548
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccSmsFullRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 549
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccSmsFullRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/os/Registrant;->notifyRegistrant()V

    goto/16 :goto_0

    .line 554
    :sswitch_36
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 556
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccRefreshRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 557
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccRefreshRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 563
    :sswitch_37
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 565
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mRingRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 566
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mRingRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 572
    :sswitch_38
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 573
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mRestrictedStateRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 574
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mRestrictedStateRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 580
    :sswitch_39
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 582
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 583
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto/16 :goto_0

    .line 588
    :sswitch_3a
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    move-object/from16 v21, v20

    .line 590
    check-cast v21, Landroid/telephony/SmsMessage;

    .line 592
    .restart local v21       #sms:Landroid/telephony/SmsMessage;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCdmaSmsRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 593
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCdmaSmsRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v21

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 599
    .end local v21           #sms:Landroid/telephony/SmsMessage;
    :sswitch_3b
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 601
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mGsmBroadcastSmsRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 602
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mGsmBroadcastSmsRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 608
    :sswitch_3c
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccSmsFullRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 611
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mIccSmsFullRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/os/Registrant;->notifyRegistrant()V

    goto/16 :goto_0

    .line 616
    :sswitch_3d
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->unsljLog(I)V

    .line 618
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 619
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/os/Registrant;->notifyRegistrant()V

    goto/16 :goto_0

    .line 624
    :sswitch_3e
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 626
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCallWaitingInfoRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 627
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mCallWaitingInfoRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 633
    :sswitch_3f
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 635
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mOtaProvisionRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 636
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mOtaProvisionRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 645
    :sswitch_40
    :try_start_3
    move-object/from16 v0, v20

    check-cast v0, Ljava/util/ArrayList;

    move-object v9, v0
    :try_end_3
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_3} :catch_1

    .line 651
    .local v9, listInfoRecs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/cdma/CdmaInformationRecords;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/android/internal/telephony/cdma/CdmaInformationRecords;

    .line 652
    .local v16, rec:Lcom/android/internal/telephony/cdma/CdmaInformationRecords;
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 653
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SamsungRIL;->notifyRegistrantsCdmaInfoRec(Lcom/android/internal/telephony/cdma/CdmaInformationRecords;)V

    goto :goto_3

    .line 646
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v9           #listInfoRecs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/cdma/CdmaInformationRecords;>;"
    .end local v16           #rec:Lcom/android/internal/telephony/cdma/CdmaInformationRecords;
    :catch_1
    move-exception v7

    .line 647
    .local v7, e:Ljava/lang/ClassCastException;
    const-string v24, "RILJ"

    const-string v25, "Unexpected exception casting to listInfoRecs"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .end local v7           #e:Ljava/lang/ClassCastException;
    :sswitch_41
    move-object/from16 v24, v20

    .line 658
    check-cast v24, [B

    check-cast v24, [B

    invoke-static/range {v24 .. v24}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 659
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mUnsolOemHookRawRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mUnsolOemHookRawRegistrant:Landroid/os/Registrant;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 665
    :sswitch_42
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 666
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mRingbackToneRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 667
    check-cast v20, [I

    check-cast v20, [I

    const/16 v24, 0x0

    aget v24, v20, v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_8

    const/4 v15, 0x1

    .line 668
    .local v15, playtone:Z
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mRingbackToneRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v27

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v28}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 667
    .end local v15           #playtone:Z
    :cond_8
    const/4 v15, 0x0

    goto :goto_4

    .line 674
    :sswitch_43
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/SamsungRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 676
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mResendIncallMuteRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 677
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/SamsungRIL;->mResendIncallMuteRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v24, v0

    new-instance v25, Landroid/os/AsyncResult;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual/range {v24 .. v25}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 301
    :sswitch_data_0
    .sparse-switch
        0x3e8 -> :sswitch_0
        0x3e9 -> :sswitch_2
        0x3ea -> :sswitch_3
        0x3eb -> :sswitch_4
        0x3ec -> :sswitch_5
        0x3ed -> :sswitch_6
        0x3ee -> :sswitch_7
        0x3f0 -> :sswitch_8
        0x3f1 -> :sswitch_9
        0x3f2 -> :sswitch_a
        0x3f3 -> :sswitch_b
        0x3f4 -> :sswitch_c
        0x3f5 -> :sswitch_d
        0x3f6 -> :sswitch_e
        0x3f7 -> :sswitch_f
        0x3f8 -> :sswitch_10
        0x3f9 -> :sswitch_11
        0x3fa -> :sswitch_12
        0x3fb -> :sswitch_14
        0x3fc -> :sswitch_15
        0x3fd -> :sswitch_16
        0x3fe -> :sswitch_17
        0x3ff -> :sswitch_13
        0x400 -> :sswitch_18
        0x401 -> :sswitch_19
        0x402 -> :sswitch_1a
        0x403 -> :sswitch_1b
        0x404 -> :sswitch_1c
        0x405 -> :sswitch_1d
        0x406 -> :sswitch_1e
        0x2afa -> :sswitch_21
        0x2aff -> :sswitch_20
        0x2b00 -> :sswitch_22
        0x2b02 -> :sswitch_25
        0x2b03 -> :sswitch_24
        0x2b04 -> :sswitch_23
        0x2b08 -> :sswitch_1f
    .end sparse-switch

    .line 359
    :sswitch_data_1
    .sparse-switch
        0x3e8 -> :sswitch_1
        0x3e9 -> :sswitch_26
        0x3ea -> :sswitch_28
        0x3eb -> :sswitch_29
        0x3ec -> :sswitch_2a
        0x3ed -> :sswitch_2b
        0x3ee -> :sswitch_2c
        0x3f0 -> :sswitch_2d
        0x3f1 -> :sswitch_2e
        0x3f2 -> :sswitch_2f
        0x3f3 -> :sswitch_30
        0x3f4 -> :sswitch_31
        0x3f5 -> :sswitch_32
        0x3f6 -> :sswitch_33
        0x3f7 -> :sswitch_34
        0x3f8 -> :sswitch_35
        0x3f9 -> :sswitch_36
        0x3fa -> :sswitch_37
        0x3fb -> :sswitch_39
        0x3fc -> :sswitch_3a
        0x3fd -> :sswitch_3b
        0x3fe -> :sswitch_3c
        0x3ff -> :sswitch_38
        0x400 -> :sswitch_3d
        0x401 -> :sswitch_3e
        0x402 -> :sswitch_3f
        0x403 -> :sswitch_40
        0x404 -> :sswitch_41
        0x405 -> :sswitch_42
        0x406 -> :sswitch_43
        0x2b08 -> :sswitch_27
    .end sparse-switch
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 17
    .parameter "p"

    .prologue
    .line 690
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v1

    .line 691
    .local v1, dataAvail:I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v6

    .line 692
    .local v6, pos:I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataSize()I

    move-result v8

    .line 694
    .local v8, size:I
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Parcel size = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Parcel pos = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 696
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Parcel dataAvail = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 700
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 702
    .local v5, num:I
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "num = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 703
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 705
    .local v7, response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v5, :cond_7

    .line 706
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    if-eqz v12, :cond_0

    .line 707
    new-instance v2, Lcom/android/internal/telephony/SamsungRIL$SamsungDriverCall;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/android/internal/telephony/SamsungRIL$SamsungDriverCall;-><init>(Lcom/android/internal/telephony/SamsungRIL;)V

    .line 711
    .local v2, dc:Lcom/android/internal/telephony/DriverCall;
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    invoke-static {v12}, Lcom/android/internal/telephony/DriverCall;->stateFromCLCC(I)Lcom/android/internal/telephony/DriverCall$State;

    move-result-object v12

    iput-object v12, v2, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    .line 712
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "state = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v2, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 713
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    iput v12, v2, Lcom/android/internal/telephony/DriverCall;->index:I

    .line 714
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "index = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v2, Lcom/android/internal/telephony/DriverCall;->index:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    iput v12, v2, Lcom/android/internal/telephony/DriverCall;->TOA:I

    .line 716
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "state = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v2, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 717
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    if-eqz v12, :cond_1

    const/4 v12, 0x1

    :goto_2
    iput-boolean v12, v2, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    .line 718
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isMpty = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-boolean v14, v2, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    if-eqz v12, :cond_2

    const/4 v12, 0x1

    :goto_3
    iput-boolean v12, v2, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    .line 720
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isMT = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-boolean v14, v2, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 721
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    iput v12, v2, Lcom/android/internal/telephony/DriverCall;->als:I

    .line 722
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "als = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v2, Lcom/android/internal/telephony/DriverCall;->als:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 723
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    .line 724
    .local v11, voiceSettings:I
    if-nez v11, :cond_3

    const/4 v12, 0x0

    :goto_4
    iput-boolean v12, v2, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    .line 725
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isVoice = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-boolean v14, v2, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 726
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    if-eqz v12, :cond_4

    const/4 v12, 0x1

    :goto_5
    iput-boolean v12, v2, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    .line 728
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    .line 730
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Samsung magic = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v2, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 732
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "number = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v2, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 733
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 734
    .local v4, np:I
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "np = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 735
    invoke-static {v4}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v12

    iput v12, v2, Lcom/android/internal/telephony/DriverCall;->numberPresentation:I

    .line 736
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v2, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    .line 737
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "name = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v2, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    iput v12, v2, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    .line 739
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "namePresentation = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v2, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v10

    .line 741
    .local v10, uusInfoPresent:I
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "uusInfoPresent = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 743
    const/4 v12, 0x1

    if-ne v10, v12, :cond_5

    .line 744
    new-instance v12, Lcom/android/internal/telephony/UUSInfo;

    invoke-direct {v12}, Lcom/android/internal/telephony/UUSInfo;-><init>()V

    iput-object v12, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    .line 745
    iget-object v12, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/android/internal/telephony/UUSInfo;->setType(I)V

    .line 746
    iget-object v12, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/android/internal/telephony/UUSInfo;->setDcs(I)V

    .line 747
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v9

    .line 748
    .local v9, userData:[B
    iget-object v12, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12, v9}, Lcom/android/internal/telephony/UUSInfo;->setUserData([B)V

    .line 749
    const-string v12, "RILJ"

    const-string v13, "Incoming UUS : type=%d, dcs=%d, length=%d"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    iget-object v0, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    iget-object v0, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x2

    iget-object v0, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 753
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Incoming UUS : data (string)="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    new-instance v14, Ljava/lang/String;

    iget-object v15, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v15}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 755
    const-string v12, "RILJ"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Incoming UUS : data (hex): "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v2, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v14}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v14

    invoke-static {v14}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 762
    .end local v9           #userData:[B
    :goto_6
    iget-object v12, v2, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    iget v13, v2, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-static {v12, v13}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v2, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 764
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 766
    iget-boolean v12, v2, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    if-eqz v12, :cond_6

    .line 767
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/SamsungRIL;->mVoicePrivacyOnRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v12}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 768
    const-string v12, "RILJ"

    const-string v13, "InCall VoicePrivacy is enabled"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    :goto_7
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 709
    .end local v2           #dc:Lcom/android/internal/telephony/DriverCall;
    .end local v4           #np:I
    .end local v10           #uusInfoPresent:I
    .end local v11           #voiceSettings:I
    :cond_0
    new-instance v2, Lcom/android/internal/telephony/DriverCall;

    invoke-direct {v2}, Lcom/android/internal/telephony/DriverCall;-><init>()V

    .restart local v2       #dc:Lcom/android/internal/telephony/DriverCall;
    goto/16 :goto_1

    .line 717
    :cond_1
    const/4 v12, 0x0

    goto/16 :goto_2

    .line 719
    :cond_2
    const/4 v12, 0x0

    goto/16 :goto_3

    .line 724
    .restart local v11       #voiceSettings:I
    :cond_3
    const/4 v12, 0x1

    goto/16 :goto_4

    .line 726
    :cond_4
    const/4 v12, 0x0

    goto/16 :goto_5

    .line 758
    .restart local v4       #np:I
    .restart local v10       #uusInfoPresent:I
    :cond_5
    const-string v12, "RILJ"

    const-string v13, "Incoming UUS : NOT present!"

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 770
    :cond_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/SamsungRIL;->mVoicePrivacyOffRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v12}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 771
    const-string v12, "RILJ"

    const-string v13, "InCall VoicePrivacy is disabled"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 775
    .end local v2           #dc:Lcom/android/internal/telephony/DriverCall;
    .end local v4           #np:I
    .end local v10           #uusInfoPresent:I
    .end local v11           #voiceSettings:I
    :cond_7
    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 777
    return-object v7
.end method

.method protected responseCdmaSubscription(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 10
    .parameter "p"

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 934
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    move-object v1, v3

    check-cast v1, [Ljava/lang/String;

    .line 936
    .local v1, response:[Ljava/lang/String;
    array-length v3, v1

    if-ne v3, v9, :cond_0

    .line 938
    const-string/jumbo v3, "ril.prl_ver_1"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v0, v3, v5

    .line 939
    .local v0, prlVersion:Ljava/lang/String;
    const/4 v3, 0x5

    new-array v2, v3, [Ljava/lang/String;

    aget-object v3, v1, v6

    aput-object v3, v2, v6

    aget-object v3, v1, v5

    aput-object v3, v2, v5

    aget-object v3, v1, v7

    aput-object v3, v2, v7

    aget-object v3, v1, v8

    aput-object v3, v2, v8

    aput-object v0, v2, v9

    .end local v1           #response:[Ljava/lang/String;
    .local v2, response:[Ljava/lang/String;
    move-object v1, v2

    .line 943
    .end local v0           #prlVersion:Ljava/lang/String;
    .end local v2           #response:[Ljava/lang/String;
    .restart local v1       #response:[Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method protected responseDeactivateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .parameter "p"

    .prologue
    .line 923
    iget-boolean v0, p0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    if-eqz v0, :cond_0

    .line 925
    const-string v0, "RILJ"

    const-string v1, "Set ril.cdma.data_state=0."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    const-string/jumbo v0, "ril.cdma.data_state"

    const-string v1, "0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected responseNetworkType(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 4
    .parameter "p"

    .prologue
    const/4 v3, 0x0

    .line 836
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    move-object v0, v1

    check-cast v0, [I

    .line 839
    .local v0, response:[I
    iget-boolean v1, p0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    if-nez v1, :cond_0

    aget v1, v0, v3

    const/4 v2, 0x7

    if-ne v1, v2, :cond_0

    .line 840
    const-string v1, "RILJ"

    const-string v2, "Overriding network type response from global to WCDMA preferred"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 841
    aput v3, v0, v3

    .line 844
    :cond_0
    return-object v0
.end method

.method protected responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 9
    .parameter "p"

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 850
    new-instance v0, Lcom/android/internal/telephony/DataCallState;

    invoke-direct {v0}, Lcom/android/internal/telephony/DataCallState;-><init>()V

    .line 851
    .local v0, dataCall:Lcom/android/internal/telephony/DataCallState;
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    move-object v2, v3

    check-cast v2, [Ljava/lang/String;

    .line 853
    .local v2, strings:[Ljava/lang/String;
    array-length v3, v2

    if-lt v3, v8, :cond_3

    .line 854
    aget-object v3, v2, v7

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v0, Lcom/android/internal/telephony/DataCallState;->cid:I

    .line 856
    iget-boolean v3, p0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    if-eqz v3, :cond_2

    .line 858
    aget-object v3, v2, v6

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/SamsungRIL;->startPppdCdmaService(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 860
    sget-object v3, Lcom/android/internal/telephony/DataConnection$FailCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/DataConnection$FailCause;

    invoke-virtual {v3}, Lcom/android/internal/telephony/DataConnection$FailCause;->getErrorCode()I

    move-result v3

    iput v3, v0, Lcom/android/internal/telephony/DataCallState;->status:I

    .line 883
    :cond_0
    :goto_0
    return-object v0

    .line 865
    :cond_1
    const-string/jumbo v3, "net.cdma.ppp.interface"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/android/internal/telephony/DataCallState;->ifname:Ljava/lang/String;

    .line 866
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "net."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/android/internal/telephony/DataCallState;->ifname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 868
    .local v1, ifprop:Ljava/lang/String;
    new-array v3, v6, [Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".local-ip"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    iput-object v3, v0, Lcom/android/internal/telephony/DataCallState;->addresses:[Ljava/lang/String;

    .line 869
    new-array v3, v6, [Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".remote-ip"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    iput-object v3, v0, Lcom/android/internal/telephony/DataCallState;->gateways:[Ljava/lang/String;

    .line 870
    new-array v3, v8, [Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".dns1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".dns2"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    iput-object v3, v0, Lcom/android/internal/telephony/DataCallState;->dnses:[Ljava/lang/String;

    goto/16 :goto_0

    .line 873
    .end local v1           #ifprop:Ljava/lang/String;
    :cond_2
    aget-object v3, v2, v6

    iput-object v3, v0, Lcom/android/internal/telephony/DataCallState;->ifname:Ljava/lang/String;

    .line 875
    array-length v3, v2

    const/4 v4, 0x3

    if-lt v3, v4, :cond_0

    .line 876
    aget-object v3, v2, v8

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/android/internal/telephony/DataCallState;->addresses:[Ljava/lang/String;

    goto/16 :goto_0

    .line 880
    :cond_3
    sget-object v3, Lcom/android/internal/telephony/DataConnection$FailCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/DataConnection$FailCause;

    invoke-virtual {v3}, Lcom/android/internal/telephony/DataConnection$FailCause;->getErrorCode()I

    move-result v3

    iput v3, v0, Lcom/android/internal/telephony/DataCallState;->status:I

    goto/16 :goto_0
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 10
    .parameter "p"

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v4, -0x1

    .line 782
    const/16 v1, 0xc

    .line 786
    .local v1, numInts:I
    new-array v2, v1, [I

    .line 787
    .local v2, response:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v3, 0x7

    if-ge v0, v3, :cond_0

    .line 788
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    aput v3, v2, v0

    .line 787
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 791
    :cond_0
    const/4 v0, 0x7

    :goto_1
    if-ge v0, v1, :cond_1

    .line 792
    aput v4, v2, v0

    .line 791
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 795
    :cond_1
    iget-boolean v3, p0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    if-eqz v3, :cond_3

    .line 817
    :cond_2
    :goto_2
    return-object v2

    .line 801
    :cond_3
    iget-boolean v3, p0, Lcom/android/internal/telephony/SamsungRIL;->mSignalbarCount:Z

    if-eqz v3, :cond_5

    .line 805
    aget v3, v2, v6

    const v5, 0xff00

    and-int/2addr v3, v5

    shr-int/lit8 v3, v3, 0x8

    mul-int/lit8 v3, v3, 0x3

    aput v3, v2, v6

    .line 809
    :goto_3
    const/4 v3, 0x1

    aput v4, v2, v3

    .line 810
    aget v3, v2, v7

    if-gez v3, :cond_6

    const/16 v3, -0x78

    :goto_4
    aput v3, v2, v7

    .line 811
    aget v3, v2, v8

    if-gez v3, :cond_7

    const/16 v3, -0xa0

    :goto_5
    aput v3, v2, v8

    .line 812
    aget v3, v2, v9

    if-gez v3, :cond_8

    const/16 v3, -0x78

    :goto_6
    aput v3, v2, v9

    .line 813
    const/4 v5, 0x5

    const/4 v3, 0x5

    aget v3, v2, v3

    if-gez v3, :cond_9

    move v3, v4

    :goto_7
    aput v3, v2, v5

    .line 814
    const/4 v3, 0x6

    aget v3, v2, v3

    if-ltz v3, :cond_4

    const/4 v3, 0x6

    aget v3, v2, v3

    const/16 v5, 0x8

    if-le v3, v5, :cond_2

    .line 815
    :cond_4
    const/4 v3, 0x6

    aput v4, v2, v3

    goto :goto_2

    .line 807
    :cond_5
    aget v3, v2, v6

    and-int/lit16 v3, v3, 0xff

    aput v3, v2, v6

    goto :goto_3

    .line 810
    :cond_6
    aget v3, v2, v7

    neg-int v3, v3

    goto :goto_4

    .line 811
    :cond_7
    aget v3, v2, v8

    neg-int v3, v3

    goto :goto_5

    .line 812
    :cond_8
    aget v3, v2, v9

    neg-int v3, v3

    goto :goto_6

    .line 813
    :cond_9
    const/4 v3, 0x5

    aget v3, v2, v3

    neg-int v3, v3

    goto :goto_7
.end method

.method protected responseVoiceRegistrationState(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 6
    .parameter "p"

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x4

    const/16 v3, 0x10

    const/4 v2, 0x6

    .line 822
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    .line 824
    .local v0, response:[Ljava/lang/String;
    iget-boolean v1, p0, Lcom/android/internal/telephony/SamsungRIL;->mIsSamsungCdma:Z

    if-eqz v1, :cond_0

    array-length v1, v0

    if-le v1, v2, :cond_0

    .line 826
    aget-object v1, v0, v4

    invoke-static {v1, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    .line 827
    aget-object v1, v0, v5

    invoke-static {v1, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    .line 828
    aget-object v1, v0, v2

    invoke-static {v1, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    .line 831
    :cond_0
    return-object v0
.end method

.method public setCurrentPreferredNetworkType()V
    .locals 1

    .prologue
    .line 973
    const-string/jumbo v0, "setCurrentPreferredNetworkType IGNORED"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    .line 979
    return-void
.end method

.method public setPreferredNetworkType(ILandroid/os/Message;)V
    .locals 4
    .parameter "networkType"
    .parameter "response"

    .prologue
    .line 986
    iget-object v2, p0, Lcom/android/internal/telephony/SamsungRIL;->mContext:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 989
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 991
    new-instance v1, Lcom/android/internal/telephony/SamsungRIL$ConnectivityHandler;

    iget-object v2, p0, Lcom/android/internal/telephony/SamsungRIL;->mContext:Landroid/content/Context;

    invoke-direct {v1, p0, v2}, Lcom/android/internal/telephony/SamsungRIL$ConnectivityHandler;-><init>(Lcom/android/internal/telephony/SamsungRIL;Landroid/content/Context;)V

    .line 992
    .local v1, handler:Lcom/android/internal/telephony/SamsungRIL$ConnectivityHandler;
    invoke-virtual {v1, p1, p2}, Lcom/android/internal/telephony/SamsungRIL$ConnectivityHandler;->setPreferedNetworkType(ILandroid/os/Message;)V

    .line 996
    .end local v1           #handler:Lcom/android/internal/telephony/SamsungRIL$ConnectivityHandler;
    :goto_0
    return-void

    .line 994
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/SamsungRIL;->sendPreferedNetworktype(ILandroid/os/Message;)V

    goto :goto_0
.end method

.method public setRadioPower(ZLandroid/os/Message;)V
    .locals 4
    .parameter "on"
    .parameter "result"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 59
    const/16 v1, 0x17

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 62
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    if-eqz p1, :cond_0

    .line 64
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 65
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 71
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SamsungRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungRIL;->riljLog(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SamsungRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 73
    return-void

    .line 67
    :cond_0
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 68
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0
.end method
