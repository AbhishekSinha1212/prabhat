
CREATE TABLE [E_1]
( 
	[test]               char(18)  NOT NULL ,
	[demo]               char(18)  NULL 
)
go

ALTER TABLE [E_1]
	ADD CONSTRAINT [XPKE_1] PRIMARY KEY  CLUSTERED ([test] ASC)
go

CREATE TABLE [E_2]
( 
	[one]                char(18)  NOT NULL ,
	[two]                char(18)  NULL ,
	[test]               char(18)  NOT NULL 
)
go

ALTER TABLE [E_2]
	ADD CONSTRAINT [XPKE_2] PRIMARY KEY  CLUSTERED ([one] ASC,[test] ASC)
go

CREATE TABLE [E_3]
( 
	[sam]                char(18)  NOT NULL ,
	[abd]                char(18)  NULL 
)
go

ALTER TABLE [E_3]
	ADD CONSTRAINT [XPKE_3] PRIMARY KEY  CLUSTERED ([sam] ASC)
go


ALTER TABLE [E_2]
	ADD CONSTRAINT [R_1] FOREIGN KEY ([test]) REFERENCES [E_1]([test])
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
    /* E_1  E_2 on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000f7cf", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="test" */
    IF EXISTS (
      SELECT * FROM deleted,E_2
      WHERE
        /*  %JoinFKPK(E_2,deleted," = "," AND") */
        E_2.test = deleted.test
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete E_1 because E_2 exists.'
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
           @instest char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_1  E_2 on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011a12", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="test" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(test)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,E_2
      WHERE
        /*  %JoinFKPK(E_2,deleted," = "," AND") */
        E_2.test = deleted.test
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update E_1 because E_2 exists.'
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
    /* E_1  E_2 on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011ad6", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="test" */
    IF EXISTS (SELECT * FROM deleted,E_1
      WHERE
        /* %JoinFKPK(deleted,E_1," = "," AND") */
        deleted.test = E_1.test AND
        NOT EXISTS (
          SELECT * FROM E_2
          WHERE
            /* %JoinFKPK(E_2,E_1," = "," AND") */
            E_2.test = E_1.test
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last E_2 because E_1 exists.'
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
           @insone char(18), 
           @instest char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* E_1  E_2 on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00015b40", PARENT_OWNER="", PARENT_TABLE="E_1"
    CHILD_OWNER="", CHILD_TABLE="E_2"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="test" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(test)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,E_1
        WHERE
          /* %JoinFKPK(inserted,E_1) */
          inserted.test = E_1.test
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update E_2 because E_1 does not exist.'
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


