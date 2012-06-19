.class Lcom/android/internal/telephony/SemcRIL$IccHandler;
.super Landroid/os/Handler;
.source "SemcRIL.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/SemcRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IccHandler"
.end annotation


# static fields
.field private static final EVENT_GET_ICC_STATUS_DONE:I = 0x1

.field private static final EVENT_ICC_STATUS_CHANGED:I = 0x2


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/SemcRIL;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/SemcRIL;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    .line 348
    iput-object p1, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    .line 349
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 350
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .parameter "paramMessage"

    .prologue
    const/4 v7, 0x2

    .line 353
    iget v6, p1, Landroid/os/Message;->what:I

    packed-switch v6, :pswitch_data_0

    .line 426
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " Unknown Event "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p1, Landroid/os/Message;->what:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    :cond_0
    :goto_0
    return-void

    .line 355
    :pswitch_0
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 356
    .local v4, asyncResult:Landroid/os/AsyncResult;
    iget-object v6, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_1

    .line 357
    const-string v6, "RILJ"

    const-string v7, "IccCardStatusDone shouldn\'t return exceptions!"

    iget-object v8, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v6, v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 360
    :cond_1
    iget-object v5, v4, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v5, Lcom/android/internal/telephony/IccCardStatus;

    .line 361
    .local v5, status:Lcom/android/internal/telephony/IccCardStatus;
    invoke-virtual {v5}, Lcom/android/internal/telephony/IccCardStatus;->getNumApplications()I

    move-result v6

    if-nez v6, :cond_3

    .line 362
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    invoke-virtual {v6}, Lcom/android/internal/telephony/SemcRIL;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 366
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    iget v6, v6, Lcom/android/internal/telephony/SemcRIL;->mPhoneType:I

    if-ne v6, v7, :cond_2

    .line 367
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    sget-object v7, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RUIM_LOCKED_OR_ABSENT:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/SemcRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    goto :goto_0

    .line 369
    :cond_2
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    sget-object v7, Lcom/android/internal/telephony/CommandsInterface$RadioState;->SIM_LOCKED_OR_ABSENT:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/SemcRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    goto :goto_0

    .line 372
    :cond_3
    const/4 v0, -0x1

    .line 373
    .local v0, appIndex:I
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    iget v6, v6, Lcom/android/internal/telephony/SemcRIL;->mPhoneType:I

    if-ne v6, v7, :cond_4

    .line 374
    invoke-virtual {v5}, Lcom/android/internal/telephony/IccCardStatus;->getCdmaSubscriptionAppIndex()I

    move-result v0

    .line 375
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

    .line 381
    :goto_1
    invoke-virtual {v5, v0}, Lcom/android/internal/telephony/IccCardStatus;->getApplication(I)Lcom/android/internal/telephony/IccCardApplication;

    move-result-object v3

    .line 382
    .local v3, application:Lcom/android/internal/telephony/IccCardApplication;
    iget-object v1, v3, Lcom/android/internal/telephony/IccCardApplication;->app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;

    .line 383
    .local v1, app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;
    iget-object v2, v3, Lcom/android/internal/telephony/IccCardApplication;->app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;

    .line 385
    .local v2, app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;
    sget-object v6, Lcom/android/internal/telephony/SemcRIL$1;->$SwitchMap$com$android$internal$telephony$IccCardApplication$AppState:[I

    invoke-virtual {v1}, Lcom/android/internal/telephony/IccCardApplication$AppState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_1

    goto :goto_0

    .line 388
    :pswitch_1
    sget-object v6, Lcom/android/internal/telephony/SemcRIL$1;->$SwitchMap$com$android$internal$telephony$IccCardApplication$AppType:[I

    invoke-virtual {v2}, Lcom/android/internal/telephony/IccCardApplication$AppType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_2

    .line 398
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Currently we don\'t handle SIMs of type: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 377
    .end local v1           #app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;
    .end local v2           #app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;
    .end local v3           #application:Lcom/android/internal/telephony/IccCardApplication;
    :cond_4
    invoke-virtual {v5}, Lcom/android/internal/telephony/IccCardStatus;->getGsmUmtsSubscriptionAppIndex()I

    move-result v0

    .line 378
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

    .line 391
    .restart local v1       #app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;
    .restart local v2       #app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;
    .restart local v3       #application:Lcom/android/internal/telephony/IccCardApplication;
    :pswitch_2
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    sget-object v7, Lcom/android/internal/telephony/CommandsInterface$RadioState;->SIM_LOCKED_OR_ABSENT:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/SemcRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    goto/16 :goto_0

    .line 395
    :pswitch_3
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    sget-object v7, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RUIM_LOCKED_OR_ABSENT:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/SemcRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    goto/16 :goto_0

    .line 403
    :pswitch_4
    sget-object v6, Lcom/android/internal/telephony/SemcRIL$1;->$SwitchMap$com$android$internal$telephony$IccCardApplication$AppType:[I

    invoke-virtual {v2}, Lcom/android/internal/telephony/IccCardApplication$AppType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_3

    .line 413
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Currently we don\'t handle SIMs of type: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 406
    :pswitch_5
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    sget-object v7, Lcom/android/internal/telephony/CommandsInterface$RadioState;->SIM_READY:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/SemcRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    goto/16 :goto_0

    .line 410
    :pswitch_6
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    sget-object v7, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RUIM_READY:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/SemcRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    goto/16 :goto_0

    .line 423
    .end local v0           #appIndex:I
    .end local v1           #app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;
    .end local v2           #app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;
    .end local v3           #application:Lcom/android/internal/telephony/IccCardApplication;
    .end local v4           #asyncResult:Landroid/os/AsyncResult;
    .end local v5           #status:Lcom/android/internal/telephony/IccCardStatus;
    :pswitch_7
    iget-object v6, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/SemcRIL$IccHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/SemcRIL;->getIccCardStatus(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 353
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_7
    .end packed-switch

    .line 385
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_4
    .end packed-switch

    .line 388
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
    .end packed-switch

    .line 403
    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_5
        :pswitch_5
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public run()V
    .locals 3

    .prologue
    .line 432
    iget-object v0, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/SemcRIL;->unregisterForIccStatusChanged(Landroid/os/Handler;)V

    .line 433
    iget-object v0, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/SemcRIL;->registerForIccStatusChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 434
    iget-object v0, p0, Lcom/android/internal/telephony/SemcRIL$IccHandler;->this$0:Lcom/android/internal/telephony/SemcRIL;

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SemcRIL$IccHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SemcRIL;->getIccCardStatus(Landroid/os/Message;)V

    .line 435
    return-void
.end method
