
CREATE TABLE [E_1]
( 
	[One]                char(18)  NOT NULL 
)
go

ALTER TABLE [E_1]
	ADD CONSTRAINT [XPKE_1] PRIMARY KEY  CLUSTERED ([One] ASC)
go

CREATE TABLE [E_1_E_2]
( 
	[One]                char(18)  NOT NULL ,
	[two]                char(18)  NOT NULL 
)
go

ALTER TABLE [E_1_E_2]
	ADD CONSTRAINT [XPKE_1_E_2] PRIMARY KEY  CLUSTERED ([One] ASC,[two] ASC)
go

CREATE TABLE [E_2]
( 
	[two]                char(18)  NOT NULL 
)
go

ALTER TABLE [E_2]
	ADD CONSTRAINT [XPKE_2] PRIMARY KEY  CLUSTERED ([two] ASC)
go

CREATE TABLE [E_2_E_4]
( 
	[two]                char(18)  NOT NULL ,
	[four]               char(18)  NOT NULL 
)
go

ALTER TABLE [E_2_E_4]
	ADD CONSTRAINT [XPKE_2_E_4] PRIMARY KEY  CLUSTERED ([two] ASC,[four] ASC)
go

CREATE TABLE [E_3]
( 
	[three]              char(18)  NOT NULL ,
	[four]               char(18)  NULL 
)
go

ALTER TABLE [E_3]
	ADD CONSTRAINT [XPKE_3] PRIMARY KEY  CLUSTERED ([three] ASC)
go

CREATE TABLE [E_4]
( 
	[four]               char(18)  NOT NULL 
)
go

ALTER TABLE [E_4]
	ADD CONSTRAINT [XPKE_4] PRIMARY KEY  CLUSTERED ([four] ASC)
go

CREATE VIEW [new_view]([v1],[v2])
WITH SCHEMABINDING
AS
SELECT Expr_227,Expr_228
	FROM [new_view]
go


ALTER TABLE [E_1_E_2]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([One]) REFERENCES [E_1]([One])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [E_1_E_2]
	ADD CONSTRAINT [R_3] FOREIGN KEY ([two]) REFERENCES [E_2]([two])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [E_2_E_4]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([two]) REFERENCES [E_2]([two])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [E_2_E_4]
	ADD CONSTRAINT [R_6] FOREIGN KEY ([four]) REFERENCES [E_4]([four])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [E_3]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([four]) REFERENCES [E_4]([four])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_E_1 ON E_1 FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on E_1 */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* E_1  E_1_E_2 on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010298", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="One" */
    IF EXISTS (
      SELECT * FROM deleted,E_1_E_2
      WHERE
        /*  %JoinFKPK(E_1_E_2,deleted," = "," AND") */
        E_1_E_2.One = deleted.One
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete E_1 because E_1_E_2 exists.'
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


CREATE TRIGGER tU_E_1 ON E_1 FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on E_1 */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOne char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_1  E_1_E_2 on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011218", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="One" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(One)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,E_1_E_2
      WHERE
        /*  %JoinFKPK(E_1_E_2,deleted," = "," AND") */
        E_1_E_2.One = deleted.One
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update E_1 because E_1_E_2 exists.'
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




CREATE TRIGGER tD_E_1_E_2 ON E_1_E_2 FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on E_1_E_2 */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* E_2  E_1_E_2 on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00021cee", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="two" */
    IF EXISTS (SELECT * FROM deleted,E_2
      WHERE
        /* %JoinFKPK(deleted,E_2," = "," AND") */
        deleted.two = E_2.two AND
        NOT EXISTS (
          SELECT * FROM E_1_E_2
          WHERE
            /* %JoinFKPK(E_1_E_2,E_2," = "," AND") */
            E_1_E_2.two = E_2.two
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last E_1_E_2 because E_2 exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* E_1  E_1_E_2 on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="One" */
    IF EXISTS (SELECT * FROM deleted,E_1
      WHERE
        /* %JoinFKPK(deleted,E_1," = "," AND") */
        deleted.One = E_1.One AND
        NOT EXISTS (
          SELECT * FROM E_1_E_2
          WHERE
            /* %JoinFKPK(E_1_E_2,E_1," = "," AND") */
            E_1_E_2.One = E_1.One
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last E_1_E_2 because E_1 exists.'
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


CREATE TRIGGER tU_E_1_E_2 ON E_1_E_2 FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on E_1_E_2 */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOne char(18), 
           @instwo char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_2  E_1_E_2 on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00027216", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="two" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(two)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,E_2
        WHERE
          /* %JoinFKPK(inserted,E_2) */
          inserted.two = E_2.two
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update E_1_E_2 because E_2 does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* E_1  E_1_E_2 on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="One" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(One)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,E_1
        WHERE
          /* %JoinFKPK(inserted,E_1) */
          inserted.One = E_1.One
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update E_1_E_2 because E_1 does not exist.'
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




CREATE TRIGGER tD_E_2 ON E_2 FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on E_2 */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* E_2  E_2_E_4 on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001cb95", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="two" */
    IF EXISTS (
      SELECT * FROM deleted,E_2_E_4
      WHERE
        /*  %JoinFKPK(E_2_E_4,deleted," = "," AND") */
        E_2_E_4.two = deleted.two
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete E_2 because E_2_E_4 exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* E_2  E_1_E_2 on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="two" */
    IF EXISTS (
      SELECT * FROM deleted,E_1_E_2
      WHERE
        /*  %JoinFKPK(E_1_E_2,deleted," = "," AND") */
        E_1_E_2.two = deleted.two
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete E_2 because E_1_E_2 exists.'
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


CREATE TRIGGER tU_E_2 ON E_2 FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on E_2 */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @instwo char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_2  E_2_E_4 on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001fbfb", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="two" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(two)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,E_2_E_4
      WHERE
        /*  %JoinFKPK(E_2_E_4,deleted," = "," AND") */
        E_2_E_4.two = deleted.two
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update E_2 because E_2_E_4 exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* E_2  E_1_E_2 on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_1_E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="two" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(two)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,E_1_E_2
      WHERE
        /*  %JoinFKPK(E_1_E_2,deleted," = "," AND") */
        E_1_E_2.two = deleted.two
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update E_2 because E_1_E_2 exists.'
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




CREATE TRIGGER tD_E_2_E_4 ON E_2_E_4 FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on E_2_E_4 */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* E_4  E_2_E_4 on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000229b6", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="four" */
    IF EXISTS (SELECT * FROM deleted,E_4
      WHERE
        /* %JoinFKPK(deleted,E_4," = "," AND") */
        deleted.four = E_4.four AND
        NOT EXISTS (
          SELECT * FROM E_2_E_4
          WHERE
            /* %JoinFKPK(E_2_E_4,E_4," = "," AND") */
            E_2_E_4.four = E_4.four
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last E_2_E_4 because E_4 exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* E_2  E_2_E_4 on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="two" */
    IF EXISTS (SELECT * FROM deleted,E_2
      WHERE
        /* %JoinFKPK(deleted,E_2," = "," AND") */
        deleted.two = E_2.two AND
        NOT EXISTS (
          SELECT * FROM E_2_E_4
          WHERE
            /* %JoinFKPK(E_2_E_4,E_2," = "," AND") */
            E_2_E_4.two = E_2.two
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last E_2_E_4 because E_2 exists.'
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


CREATE TRIGGER tU_E_2_E_4 ON E_2_E_4 FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on E_2_E_4 */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @instwo char(18), 
           @insfour char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_4  E_2_E_4 on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00026e6d", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="four" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(four)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,E_4
        WHERE
          /* %JoinFKPK(inserted,E_4) */
          inserted.four = E_4.four
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update E_2_E_4 because E_4 does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* E_2  E_2_E_4 on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_2"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="two" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(two)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,E_2
        WHERE
          /* %JoinFKPK(inserted,E_2) */
          inserted.two = E_2.two
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update E_2_E_4 because E_2 does not exist.'
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




CREATE TRIGGER tD_E_3 ON E_3 FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on E_3 */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* E_4  E_3 on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012068", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_3"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="four" */
    IF EXISTS (SELECT * FROM deleted,E_4
      WHERE
        /* %JoinFKPK(deleted,E_4," = "," AND") */
        deleted.four = E_4.four AND
        NOT EXISTS (
          SELECT * FROM E_3
          WHERE
            /* %JoinFKPK(E_3,E_4," = "," AND") */
            E_3.four = E_4.four
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last E_3 because E_4 exists.'
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


CREATE TRIGGER tU_E_3 ON E_3 FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on E_3 */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insthree char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_4  E_3 on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000168d2", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_3"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="four" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(four)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,E_4
        WHERE
          /* %JoinFKPK(inserted,E_4) */
          inserted.four = E_4.four
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.four IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update E_3 because E_4 does not exist.'
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




CREATE TRIGGER tD_E_4 ON E_4 FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on E_4 */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* E_4  E_3 on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001d1c8", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_3"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="four" */
    IF EXISTS (
      SELECT * FROM deleted,E_3
      WHERE
        /*  %JoinFKPK(E_3,deleted," = "," AND") */
        E_3.four = deleted.four
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete E_4 because E_3 exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* E_4  E_2_E_4 on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="four" */
    IF EXISTS (
      SELECT * FROM deleted,E_2_E_4
      WHERE
        /*  %JoinFKPK(E_2_E_4,deleted," = "," AND") */
        E_2_E_4.four = deleted.four
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete E_4 because E_2_E_4 exists.'
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


CREATE TRIGGER tU_E_4 ON E_4 FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on E_4 */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insfour char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_4  E_3 on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00020330", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_3"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="four" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(four)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,E_3
      WHERE
        /*  %JoinFKPK(E_3,deleted," = "," AND") */
        E_3.four = deleted.four
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update E_4 because E_3 exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* E_4  E_2_E_4 on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="E_4"
    CHILD_OWNER="", CHILD_TABLE="E_2_E_4"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="four" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(four)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,E_2_E_4
      WHERE
        /*  %JoinFKPK(E_2_E_4,deleted," = "," AND") */
        E_2_E_4.four = deleted.four
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update E_4 because E_2_E_4 exists.'
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


