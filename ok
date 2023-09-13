
CREATE TYPE [standard_string]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [standard_number]
	FROM INTEGER NULL
go

CREATE TYPE [first_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [last_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [address]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [director]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [city]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [manager]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [state]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [title]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [zip_code]
	FROM INTEGER NULL
go

CREATE TYPE [phone]
	FROM INTEGER NULL
go

CREATE TYPE [address_2]
	FROM VARCHAR(20) NULL
go

CREATE RULE [Movie_genre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [CUST]
( 
	[CUST_address]       [address] ,
	[CUST_city]          [city] ,
	[CUST_first_name]    [first_name] ,
	[CUST_last_name]     [last_name] ,
	[CUST_state]         [state] ,
	[CUST_zip_code]      [zip_code] ,
	[email]              varchar  NULL ,
	[CUST_number]        integer  NOT NULL 
)
go

CREATE TABLE [CUST_CREDIT]
( 
	[credit_card]        integer  NULL ,
	[credit_card_exp]    integer  NULL ,
	[status_code]        varchar(20)  NULL ,
	[CUST_number]        integer  NOT NULL 
)
go

CREATE TABLE [EMP]
( 
	[EMP_first_name]     [first_name] ,
	[EMP_address]        [address] ,
	[EMP_phone]          [phone] ,
	[store_number]       integer  NULL ,
	[EMP_address_2]      [address_2] ,
	[email]              varchar(20)  NULL ,
	[salary]             integer  NULL ,
	[hire_date]          datetime  NULL ,
	[soc_sec_number]     integer  NULL ,
	[EMP_number]         varchar(20)  NOT NULL ,
	[supervisor]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [MO_RENT_REC]
( 
	[rental_date]        datetime  NULL ,
	[due_date]           datetime  NULL ,
	[rental_status]      varchar(20)  NULL ,
	[payment_transaction_number] integer  NULL ,
	[overdue_charge]     integer  NULL ,
	[rental_rate]        integer  NULL ,
	[EMP_phone]          [phone]  NOT NULL ,
	[soc_sec_number]     integer  NOT NULL ,
	[rental_record_date] datetime  NOT NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL ,
	[CUST_number]        integer  NOT NULL 
)
go

CREATE TABLE [MOVIE]
( 
	[movie_title]        [title] ,
	[movie_director]     [director] ,
	[description]        varchar(20)  NULL ,
	[star_1_name]        [first_name] ,
	[rating]             varchar  NULL ,
	[star_2_name]        [first_name] ,
	[movie_number]       integer  NOT NULL ,
	[genre]              varchar(2)  NULL ,
	[rental_rate]        numeric  NULL ,
	[movie_url]          varchar  NULL ,
	[movie_clip]         varbinary  NULL 
)
go

CREATE TABLE [MOVIE_COPY]
( 
	[general_condition]  varchar(20)  NULL ,
	[movie_format]       varchar(20)  NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL 
)
go

CREATE TABLE [MOVIE_STORE]
( 
	[movie_number]       integer  NOT NULL ,
	[store_number]       integer  NOT NULL 
)
go

CREATE TABLE [PAYMENT]
( 
	[payment_transaction_number] integer  NOT NULL ,
	[payment_type]       char(18)  NULL ,
	[payment_amount]     numeric  NULL ,
	[payment_date]       datetime  NULL ,
	[payment_status]     varchar(1)  NULL ,
	[EMP_number]         varchar(20)  NOT NULL ,
	[CUST_number]        integer  NULL ,
	[customer_no]        integer  NULL ,
	[check_bank_number]  integer  NULL ,
	[check_number]       integer  NULL ,
	[epay_vendor_number] integer  NULL ,
	[epay_account_number] integer  NULL ,
	[credit_card_number] char(18)  NULL ,
	[credit_card_exp]    datetime  NULL ,
	[credit_card_type]   char(18)  NULL 
)
go

CREATE TABLE [STORE]
( 
	[store_manager]      [manager] ,
	[store_address]      [address] ,
	[store_address_2]    [address_2] ,
	[store_phone]        [phone] ,
	[store_city]         [city] ,
	[store_state]        [state] ,
	[store_zip_code]     [zip_code] ,
	[store_number]       integer  NOT NULL 
)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XPKCUSTOMER] PRIMARY KEY  CLUSTERED ([CUST_number] ASC)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XAK1CUSTOMER] UNIQUE ([CUST_address]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1CUSTOMER] ON [CUST]
( 
	[CUST_last_name]      ASC
)
go

ALTER TABLE [CUST_CREDIT]
	ADD CONSTRAINT [XPKCUSTOMER_CREDIT] PRIMARY KEY  CLUSTERED ([CUST_number] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XPKEMPLOYEE] PRIMARY KEY  CLUSTERED ([EMP_number] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XAK1EMPLOYEE] UNIQUE ([soc_sec_number]  ASC,[EMP_phone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1EMPLOYEE] ON [EMP]
( 
	[EMP_first_name]      ASC
)
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [XPKMOVIE_RENTAL_RECORD] PRIMARY KEY  CLUSTERED ([rental_record_date] ASC,[mo_co_num] ASC,[movie_number] ASC,[soc_sec_number] ASC,[EMP_phone] ASC,[CUST_number] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XPKMOVIE] PRIMARY KEY  CLUSTERED ([movie_number] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XAK1MOVIE] UNIQUE ([movie_title]  ASC)
go

ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [XPKMOVIE_COPY] PRIMARY KEY  CLUSTERED ([mo_co_num] ASC,[movie_number] ASC)
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [XPKMOVIE_STORE] PRIMARY KEY  CLUSTERED ([movie_number] ASC,[store_number] ASC)
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [XPKPAYMENT] PRIMARY KEY  CLUSTERED ([payment_transaction_number] ASC)
go

ALTER TABLE [STORE]
	ADD CONSTRAINT [XPKSTORE] PRIMARY KEY  CLUSTERED ([store_number] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1STORE] ON [STORE]
( 
	[store_manager]       ASC
)
go

CREATE VIEW [CUSTOMER_INVOICE]([credit_card],[credit_card_exp],[status_code],[CUST_number],[CUST_address],[email],[CUST_city],[CUST_first_name],[CUST_last_name],[CUST_state],[CUST_zip_code],[rental_record_date],[mo_co_num],[movie_number],[rental_date],[due_date],[rental_status],[overdue_charge],[rental_rate],[movie_title],[Overdue_Charge_Rate])
AS
SELECT ALL [CUST_CREDIT].[credit_card],[CUST_CREDIT].[credit_card_exp],[CUST_CREDIT].[status_code],[CUST].[CUST_number],[CUST].[CUST_address],[CUST].[email],[CUST].[CUST_city],[CUST].[CUST_first_name],[CUST].[CUST_last_name],[CUST].[CUST_state],[CUST].[CUST_zip_code],[MO_RENT_REC].[rental_record_date],[MO_RENT_REC].[mo_co_num],[MO_RENT_REC].[movie_number],[MO_RENT_REC].[rental_date],[MO_RENT_REC].[due_date],[MO_RENT_REC].[rental_status],[MO_RENT_REC].[overdue_charge],[MO_RENT_REC].[rental_rate],[MOVIE].[movie_title],rental_rate * 1.5
	FROM [CUST_CREDIT],[CUST],[MO_RENT_REC],[MOVIE]
go

CREATE VIEW [OVERDUE_NOTICE]([credit_card],[credit_card_exp],[status_code],[Overdue_Charge_Rate],[CUST_number],[CUST_address],[email],[CUST_city],[CUST_first_name],[CUST_last_name],[CUST_state],[CUST_zip_code],[rental_record_date],[mo_co_num],[movie_number],[rental_date],[due_date],[rental_status],[overdue_charge],[rental_rate])
AS
SELECT ALL [CUST_CREDIT].[credit_card],[CUST_CREDIT].[credit_card_exp],[CUST_CREDIT].[status_code],rental_rate * 1.5,[CUST].[CUST_number],[CUST].[CUST_address],[CUST].[email],[CUST].[CUST_city],[CUST].[CUST_first_name],[CUST].[CUST_last_name],[CUST].[CUST_state],[CUST].[CUST_zip_code],[MO_RENT_REC].[rental_record_date],[MO_RENT_REC].[mo_co_num],[MO_RENT_REC].[movie_number],[MO_RENT_REC].[rental_date],[MO_RENT_REC].[due_date],[MO_RENT_REC].[rental_status],[MO_RENT_REC].[overdue_charge],[MO_RENT_REC].[rental_rate]
	FROM [CUST_CREDIT],[CUST],[MO_RENT_REC]
go


ALTER TABLE [EMP]
	ADD CONSTRAINT [employs_is] FOREIGN KEY ([store_number]) REFERENCES [STORE]([store_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [reports_to] FOREIGN KEY ([supervisor]) REFERENCES [EMP]([EMP_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [completes] FOREIGN KEY ([soc_sec_number],[EMP_phone]) REFERENCES [EMP]([soc_sec_number],[EMP_phone])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [is_rented_under] FOREIGN KEY ([mo_co_num],[movie_number]) REFERENCES [MOVIE_COPY]([mo_co_num],[movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [R_8_1] FOREIGN KEY ([CUST_number]) REFERENCES [CUST]([CUST_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [R_8_2] FOREIGN KEY ([CUST_number]) REFERENCES [CUST_CREDIT]([CUST_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [is_made_on] FOREIGN KEY ([payment_transaction_number]) REFERENCES [PAYMENT]([payment_transaction_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[Movie_genre]', '[MOVIE].[genre]'
go


ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [is_rented_as] FOREIGN KEY ([movie_number]) REFERENCES [MOVIE]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [rents] FOREIGN KEY ([movie_number]) REFERENCES [MOVIE]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [is_in] FOREIGN KEY ([store_number]) REFERENCES [STORE]([store_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [receives] FOREIGN KEY ([EMP_number]) REFERENCES [EMP]([EMP_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [R_7_1] FOREIGN KEY ([customer_no]) REFERENCES [CUST]([CUST_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [R_7_2] FOREIGN KEY ([CUST_number]) REFERENCES [CUST_CREDIT]([CUST_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_CUST ON CUST FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002122a", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.customer_no = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because MO_RENT_REC exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUST ON CUST FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCUST_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00023ee5", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.customer_no = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because MO_RENT_REC exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUST_CREDIT ON CUST_CREDIT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST_CREDIT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000219b6", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST_CREDIT because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST_CREDIT because MO_RENT_REC exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUST_CREDIT ON CUST_CREDIT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST_CREDIT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCUST_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST_CREDIT makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002562f", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST_CREDIT because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST_CREDIT because MO_RENT_REC exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_EMP ON EMP FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EMP */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00054c9f", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EMP_number = deleted.EMP_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.supervisor = deleted.EMP_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because EMP exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EMP_phone = deleted.EMP_phone AND
        MO_RENT_REC.soc_sec_number = deleted.soc_sec_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.supervisor = EMP.EMP_number AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,EMP," = "," AND") */
            EMP.supervisor = EMP.EMP_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMP because EMP exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.store_number = STORE.store_number AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,STORE," = "," AND") */
            EMP.store_number = STORE.store_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMP because STORE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_EMP ON EMP FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EMP */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEMP_number varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006479b", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EMP_number = deleted.EMP_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.supervisor = deleted.EMP_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because EMP exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EMP_phone = deleted.EMP_phone AND
        MO_RENT_REC.soc_sec_number = deleted.soc_sec_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.supervisor = EMP.EMP_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.supervisor IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMP because EMP does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE employs is EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.store_number = STORE.store_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.store_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMP because STORE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MO_RENT_REC ON MO_RENT_REC FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MO_RENT_REC */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0006e5e3", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.payment_transaction_number = PAYMENT.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,PAYMENT," = "," AND") */
            MO_RENT_REC.payment_transaction_number = PAYMENT.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
    IF EXISTS (SELECT * FROM deleted,CUST_CREDIT
      WHERE
        /* %JoinFKPK(deleted,CUST_CREDIT," = "," AND") */
        deleted.CUST_number = CUST_CREDIT.CUST_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CUST_CREDIT," = "," AND") */
            MO_RENT_REC.CUST_number = CUST_CREDIT.CUST_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because CUST_CREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CUST_number = CUST.CUST_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CUST," = "," AND") */
            MO_RENT_REC.CUST_number = CUST.CUST_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
    IF EXISTS (SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /* %JoinFKPK(deleted,MOVIE_COPY," = "," AND") */
        deleted.mo_co_num = MOVIE_COPY.mo_co_num AND
        deleted.movie_number = MOVIE_COPY.movie_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,MOVIE_COPY," = "," AND") */
            MO_RENT_REC.mo_co_num = MOVIE_COPY.mo_co_num AND
            MO_RENT_REC.movie_number = MOVIE_COPY.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because MOVIE_COPY exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EMP_phone = EMP.EMP_phone AND
        deleted.soc_sec_number = EMP.soc_sec_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,EMP," = "," AND") */
            MO_RENT_REC.EMP_phone = EMP.EMP_phone AND
            MO_RENT_REC.soc_sec_number = EMP.soc_sec_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MO_RENT_REC ON MO_RENT_REC FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MO_RENT_REC */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEMP_phone phone, 
           @inssoc_sec_number integer, 
           @insrental_record_date datetime, 
           @insmo_co_num integer, 
           @insmovie_number integer, 
           @insCUST_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000797ed", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.payment_transaction_number = PAYMENT.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.payment_transaction_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because PAYMENT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST_CREDIT
        WHERE
          /* %JoinFKPK(inserted,CUST_CREDIT) */
          inserted.CUST_number = CUST_CREDIT.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because CUST_CREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CUST_number = CUST.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(mo_co_num) OR
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE_COPY
        WHERE
          /* %JoinFKPK(inserted,MOVIE_COPY) */
          inserted.mo_co_num = MOVIE_COPY.mo_co_num and
          inserted.movie_number = MOVIE_COPY.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because MOVIE_COPY does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EMP_phone = EMP.EMP_phone and
          inserted.soc_sec_number = EMP.soc_sec_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE ON MOVIE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00020519", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_COPY exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE ON MOVIE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insmovie_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00025bdf", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_STORE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_COPY exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_COPY ON MOVIE_COPY FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_COPY */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00028730", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.mo_co_num = deleted.mo_co_num AND
        MO_RENT_REC.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.movie_number = MOVIE.movie_number AND
        NOT EXISTS (
          SELECT * FROM MOVIE_COPY
          WHERE
            /* %JoinFKPK(MOVIE_COPY,MOVIE," = "," AND") */
            MOVIE_COPY.movie_number = MOVIE.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_COPY because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_COPY ON MOVIE_COPY FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_COPY */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insmo_co_num integer, 
           @insmovie_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c26a", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(mo_co_num) OR
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.mo_co_num = deleted.mo_co_num AND
        MO_RENT_REC.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.movie_number = MOVIE.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_COPY because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_STORE ON MOVIE_STORE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_STORE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00027dfc", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.store_number = STORE.store_number AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,STORE," = "," AND") */
            MOVIE_STORE.store_number = STORE.store_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.movie_number = MOVIE.movie_number AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,MOVIE," = "," AND") */
            MOVIE_STORE.movie_number = MOVIE.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_STORE ON MOVIE_STORE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_STORE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insmovie_number integer, 
           @insstore_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c07b", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.store_number = STORE.store_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because STORE does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.movie_number = MOVIE.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_PAYMENT ON PAYMENT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PAYMENT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004aeff", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
    IF EXISTS (SELECT * FROM deleted,CUST_CREDIT
      WHERE
        /* %JoinFKPK(deleted,CUST_CREDIT," = "," AND") */
        deleted.CUST_number = CUST_CREDIT.CUST_number AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUST_CREDIT," = "," AND") */
            PAYMENT.CUST_number = CUST_CREDIT.CUST_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUST_CREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.customer_no = CUST.CUST_number AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUST," = "," AND") */
            PAYMENT.customer_no = CUST.CUST_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EMP_number = EMP.EMP_number AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,EMP," = "," AND") */
            PAYMENT.EMP_number = EMP.EMP_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_PAYMENT ON PAYMENT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PAYMENT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005bedd", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST_CREDIT
        WHERE
          /* %JoinFKPK(inserted,CUST_CREDIT) */
          inserted.CUST_number = CUST_CREDIT.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CUST_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUST_CREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(customer_no)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.customer_no = CUST.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.customer_no IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EMP_number = EMP.EMP_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EMP_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_STORE ON STORE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on STORE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002088c", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.store_number = deleted.store_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because MOVIE_STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.store_number = deleted.store_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_STORE ON STORE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on STORE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insstore_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00023e9e", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.store_number = deleted.store_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because MOVIE_STORE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE employs is EMP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.store_number = deleted.store_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because EMP exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


