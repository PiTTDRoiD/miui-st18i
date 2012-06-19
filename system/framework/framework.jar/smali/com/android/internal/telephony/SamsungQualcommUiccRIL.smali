.class public Lcom/android/internal/telephony/SamsungQualcommUiccRIL;
.super Lcom/android/internal/telephony/QualcommSharedRIL;
.source "SamsungQualcommUiccRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# instance fields
.field RILJ_LOGD:Z

.field RILJ_LOGV:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    const/4 v0, 0x1

    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/QualcommSharedRIL;-><init>(Landroid/content/Context;II)V

    .line 36
    iput-boolean v0, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->RILJ_LOGV:Z

    .line 37
    iput-boolean v0, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->RILJ_LOGD:Z

    .line 41
    return-void
.end method


# virtual methods
.method protected handleNitzTimeReceived(Landroid/os/Parcel;)V
    .locals 12
    .parameter "p"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 79
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 80
    .local v1, nitz:Ljava/lang/String;
    iget-boolean v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->RILJ_LOGD:Z

    if-eqz v6, :cond_0

    const/16 v6, 0x3f0

    invoke-virtual {p0, v6, v1}, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 84
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    .line 86
    .local v3, nitzReceiveTime:J
    new-array v5, v10, [Ljava/lang/Object;

    .line 88
    .local v5, result:[Ljava/lang/Object;
    move-object v0, v1

    .line 89
    .local v0, fixedNitz:Ljava/lang/String;
    const-string v6, ","

    invoke-virtual {v1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 90
    .local v2, nitzParts:[Ljava/lang/String;
    array-length v6, v2

    const/4 v7, 0x4

    if-ne v6, v7, :cond_1

    .line 92
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v7, v2, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v2, v9

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v2, v10

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    :cond_1
    aput-object v0, v5, v8

    .line 96
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v9

    .line 98
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mNITZTimeRegistrant:Landroid/os/Registrant;

    if-eqz v6, :cond_2

    .line 100
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mNITZTimeRegistrant:Landroid/os/Registrant;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v11, v5, v11}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    .line 106
    :goto_0
    return-void

    .line 104
    :cond_2
    iput-object v5, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mLastNITZTimeInfo:Ljava/lang/Object;

    goto :goto_0
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 6
    .parameter "p"

    .prologue
    const/4 v5, 0x0

    .line 47
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 48
    .local v0, dataPosition:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 50
    .local v1, response:I
    sparse-switch v1, :sswitch_data_0

    .line 58
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 61
    invoke-super {p0, p1}, Lcom/android/internal/telephony/QualcommSharedRIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 75
    :goto_0
    return-void

    .line 52
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->handleNitzTimeReceived(Landroid/os/Parcel;)V

    goto :goto_0

    .line 54
    :sswitch_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .line 65
    .local v2, ret:Ljava/lang/Object;
    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 67
    :pswitch_0
    iget-boolean v3, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->RILJ_LOGD:Z

    if-eqz v3, :cond_0

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->unsljLog(I)V

    .line 71
    :cond_0
    iget-object v3, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mVoiceNetworkStateRegistrants:Landroid/os/RegistrantList;

    new-instance v4, Landroid/os/AsyncResult;

    invoke-direct {v4, v5, v5, v5}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v3, v4}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 50
    nop

    :sswitch_data_0
    .sparse-switch
        0x3f0 -> :sswitch_0
        0x40e -> :sswitch_1
    .end sparse-switch

    .line 65
    :pswitch_data_0
    .packed-switch 0x40e
        :pswitch_0
    .end packed-switch
.end method

.method protected responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 9
    .parameter "p"

    .prologue
    .line 113
    new-instance v5, Lcom/android/internal/telephony/IccCardStatus;

    invoke-direct {v5}, Lcom/android/internal/telephony/IccCardStatus;-><init>()V

    .line 114
    .local v5, status:Lcom/android/internal/telephony/IccCardStatus;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setCardState(I)V

    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setUniversalPinState(I)V

    .line 116
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setGsmUmtsSubscriptionAppIndex(I)V

    .line 117
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setCdmaSubscriptionAppIndex(I)V

    .line 119
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setImsSubscriptionAppIndex(I)V

    .line 121
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 124
    .local v4, numApplications:I
    const/16 v6, 0x8

    if-le v4, v6, :cond_0

    .line 125
    const/16 v4, 0x8

    .line 127
    :cond_0
    invoke-virtual {v5, v4}, Lcom/android/internal/telephony/IccCardStatus;->setNumApplications(I)V

    .line 129
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 130
    new-instance v2, Lcom/android/internal/telephony/IccCardApplication;

    invoke-direct {v2}, Lcom/android/internal/telephony/IccCardApplication;-><init>()V

    .line 131
    .local v2, ca:Lcom/android/internal/telephony/IccCardApplication;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$AppType;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;

    .line 132
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->AppStateFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$AppState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->PersoSubstateFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$PersoSubState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->perso_substate:Lcom/android/internal/telephony/IccCardApplication$PersoSubState;

    .line 134
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->aid:Ljava/lang/String;

    .line 135
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->app_label:Ljava/lang/String;

    .line 136
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    iput v6, v2, Lcom/android/internal/telephony/IccCardApplication;->pin1_replaced:I

    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->PinStateFromRILInt(I)Lcom/android/internal/telephony/IccCardStatus$PinState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->pin1:Lcom/android/internal/telephony/IccCardStatus$PinState;

    .line 138
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->PinStateFromRILInt(I)Lcom/android/internal/telephony/IccCardStatus$PinState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->pin2:Lcom/android/internal/telephony/IccCardStatus$PinState;

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 141
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 143
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 144
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 145
    invoke-virtual {v5, v2}, Lcom/android/internal/telephony/IccCardStatus;->addApplication(Lcom/android/internal/telephony/IccCardApplication;)V

    .line 129
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 147
    .end local v2           #ca:Lcom/android/internal/telephony/IccCardApplication;
    :cond_1
    const/4 v0, -0x1

    .line 148
    .local v0, appIndex:I
    iget v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mPhoneType:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_4

    .line 149
    invoke-virtual {v5}, Lcom/android/internal/telephony/IccCardStatus;->getCdmaSubscriptionAppIndex()I

    move-result v0

    .line 150
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "This is a CDMA PHONE "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :goto_1
    if-lez v4, :cond_3

    .line 157
    invoke-virtual {v5, v0}, Lcom/android/internal/telephony/IccCardStatus;->getApplication(I)Lcom/android/internal/telephony/IccCardApplication;

    move-result-object v1

    .line 158
    .local v1, application:Lcom/android/internal/telephony/IccCardApplication;
    iget-object v6, v1, Lcom/android/internal/telephony/IccCardApplication;->aid:Ljava/lang/String;

    iput-object v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mAid:Ljava/lang/String;

    .line 159
    iget-object v6, v1, Lcom/android/internal/telephony/IccCardApplication;->app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;

    sget-object v7, Lcom/android/internal/telephony/IccCardApplication$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/IccCardApplication$AppType;

    if-ne v6, v7, :cond_5

    const/4 v6, 0x1

    :goto_2
    iput-boolean v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mUSIM:Z

    .line 161
    iget v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mPreferredNetworkType:I

    iput v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mSetPreferredNetworkType:I

    .line 163
    iget-object v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mAid:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 164
    const-string v6, ""

    iput-object v6, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mAid:Ljava/lang/String;

    .line 165
    :cond_2
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mAid "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mAid:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mUSIM="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v8, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mUSIM:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mSetPreferredNetworkType="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/android/internal/telephony/SamsungQualcommUiccRIL;->mSetPreferredNetworkType:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    .end local v1           #application:Lcom/android/internal/telephony/IccCardApplication;
    :cond_3
    return-object v5

    .line 152
    :cond_4
    invoke-virtual {v5}, Lcom/android/internal/telephony/IccCardStatus;->getGsmUmtsSubscriptionAppIndex()I

    move-result v0

    .line 153
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "This is a GSM PHONE "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 159
    .restart local v1       #application:Lcom/android/internal/telephony/IccCardApplication;
    :cond_5
    const/4 v6, 0x0

    goto :goto_2
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 11
    .parameter "p"

    .prologue
    const/16 v10, 0x8

    const/4 v9, 0x7

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, -0x1

    .line 174
    const/16 v2, 0xc

    .line 181
    .local v2, numInts:I
    new-array v3, v2, [I

    .line 182
    .local v3, response:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 183
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aput v4, v3, v0

    .line 182
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 187
    :cond_0
    const-string/jumbo v4, "telephony.sends_barcount"

    invoke-static {v4, v8}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 188
    .local v1, mSignalbarCount:Z
    if-eqz v1, :cond_2

    .line 191
    aget v4, v3, v7

    const v5, 0xff00

    and-int/2addr v4, v5

    shr-int/lit8 v4, v4, 0x8

    mul-int/lit8 v4, v4, 0x3

    aput v4, v3, v7

    .line 192
    aget v4, v3, v7

    if-lez v4, :cond_1

    aget v4, v3, v7

    const/16 v5, 0x63

    if-eq v4, v5, :cond_1

    .line 193
    aget v4, v3, v7

    add-int/lit8 v4, v4, -0x1

    aput v4, v3, v7

    .line 198
    :cond_1
    :goto_1
    aput v6, v3, v8

    .line 201
    const/4 v4, 0x2

    aput v6, v3, v4

    .line 202
    const/4 v4, 0x3

    aput v6, v3, v4

    .line 205
    const/4 v4, 0x4

    aput v6, v3, v4

    .line 206
    const/4 v4, 0x5

    aput v6, v3, v4

    .line 207
    const/4 v4, 0x6

    aput v6, v3, v4

    .line 210
    aget v4, v3, v9

    const/16 v5, 0x63

    if-ne v4, v5, :cond_3

    .line 213
    aput v6, v3, v9

    .line 214
    aput v6, v3, v10

    .line 215
    const/16 v4, 0x9

    aput v6, v3, v4

    .line 216
    const/16 v4, 0xa

    aput v6, v3, v4

    .line 217
    const/16 v4, 0xb

    aput v6, v3, v4

    .line 222
    :goto_2
    return-object v3

    .line 196
    :cond_2
    aget v4, v3, v7

    and-int/lit16 v4, v4, 0xff

    aput v4, v3, v7

    goto :goto_1

    .line 219
    :cond_3
    aget v4, v3, v10

    mul-int/lit8 v4, v4, -0x1

    aput v4, v3, v10

    goto :goto_2
.end method
