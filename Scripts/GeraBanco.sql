
CREATE SCHEMA IF NOT EXISTS teste DEFAULT CHARACTER SET utf8mb4;
USE teste;

-- -----------------------------------------------------
-- Table contrato
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS contrato (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cargo (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(20) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table sigla
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sigla (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(12) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(80) NULL,
  email VARCHAR(80) NULL,
  cpf VARCHAR(12) NULL,
  senha VARCHAR(80) NULL,
  codigo_re VARCHAR(12) NULL,
  codigo_bb VARCHAR(12) NULL,
  empresa VARCHAR(25) NULL,
  demanda VARCHAR(45) NULL,
  celular VARCHAR(25) NULL,
  nascimento DATE NULL,
  status VARCHAR(12) NULL,
  fk_contrato INT NOT NULL,
  fk_cargo INT NOT NULL,
  fk_sigla INT NULL,
  PRIMARY KEY (id),
  INDEX fk_Colaborador_Contrato1_idx (fk_contrato ASC) VISIBLE,
  INDEX fk_Usuario_Acesso1_idx (fk_cargo ASC) VISIBLE,
  CONSTRAINT fk_Colaborador_Contrato1
    FOREIGN KEY (fk_contrato)
    REFERENCES contrato (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Usuario_Acesso1
    FOREIGN KEY (fk_cargo)
    REFERENCES cargo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Usuario_Sigla1
    FOREIGN KEY (fk_sigla)
    REFERENCES sigla (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table perfil
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS perfil (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(12) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table usuario_X_perfil
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario_X_perfil (
  fk_usuario INT NOT NULL,
  fk_perfil INT NOT NULL,
  status INT NOT NULL,
  dt_criacao DATE NULL,
  dt_exclusao DATE NULL,
  id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  INDEX fk_Colaborador_has_Perfil_Perfil1_idx (fk_perfil ASC) VISIBLE,
  INDEX fk_Colaborador_has_Perfil_Colaborador1_idx (fk_usuario ASC) VISIBLE,
  CONSTRAINT fk_Colaborador_has_Perfil_Colaborador1
    FOREIGN KEY (fk_usuario)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Colaborador_has_Perfil_Perfil1
    FOREIGN KEY (fk_perfil)
    REFERENCES perfil (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table situacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS situacao (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ordem_forn
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ordem_forn (
  id INT NOT NULL AUTO_INCREMENT,
  numero_OF VARCHAR(12) NULL,
  numero_OF_genti VARCHAR(12) NULL,
  fabrica VARCHAR(12) NULL,
  tema VARCHAR(45) NULL,
  agil INT NULL,
  usti_bb DOUBLE NULL,
  uor VARCHAR(80) NULL,
  demanda VARCHAR(12) NULL,
  acao VARCHAR(12) NULL,
  tipo VARCHAR(20) NULL,
  cd_ti VARCHAR(12) NULL,
  dt_abertura DATETIME NULL,
  dt_previsao DATETIME NULL,
  dt_entrega DATETIME NULL,
  dt_devolvida DATETIME NULL,
  dt_recusa DATETIME NULL,
  dt_aceite DATETIME NULL,
  fk_situacao INT NULL,
  fk_situacao_alm INT NULL,
  fk_sigla INT NULL,
  fk_usuario INT NULL,
  responsavel_t VARCHAR(80) NULL,
  gerente_t VARCHAR(80) NULL,
  PRIMARY KEY (id),
  INDEX fk_ordem_forn_situacao1_idx (fk_situacao ASC) VISIBLE,
  INDEX fk_ordem_forn_Sigla1_idx (fk_sigla ASC) VISIBLE,
  INDEX fk_ordem_forn_Usuario1_idx (fk_usuario ASC) VISIBLE,
  CONSTRAINT fk_ordem_forn_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ordem_forn_situacao_alm
    FOREIGN KEY (fk_situacao_alm)
    REFERENCES situacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ordem_forn_Sigla1
    FOREIGN KEY (fk_sigla)
    REFERENCES sigla (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ordem_forn_Usuario1
    FOREIGN KEY (fk_usuario)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table historico_OF
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS historico_OF (
  id INT NOT NULL AUTO_INCREMENT,
  dt_criacao DATETIME NULL,
  fk_ordem_forn INT NULL,
  fk_usuario INT NULL,
  fk_situacao INT NULL,
  PRIMARY KEY (id),
  INDEX fk_historico_OF_ordem_forn1_idx (fk_ordem_forn ASC) VISIBLE,
  INDEX fk_historico_OF_Usuario1_idx (fk_usuario ASC) VISIBLE,
  INDEX fk_historico_OF_situacao1_idx (fk_situacao ASC) VISIBLE,
  CONSTRAINT fk_historico_OF_ordem_forn1
    FOREIGN KEY (fk_ordem_forn)
    REFERENCES ordem_forn (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_historico_OF_Usuario1
    FOREIGN KEY (fk_usuario)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_historico_OF_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table migracao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS migracao (
  id INT NOT NULL AUTO_INCREMENT,
  dt_criacao DATETIME NULL,
  fk_usuario INT NULL,
  PRIMARY KEY (id),
  INDEX fk_migracao_usuario1_idx (fk_usuario ASC) VISIBLE,
  CONSTRAINT fk_migracao_usuArio1
    FOREIGN KEY (fk_usuario)
    REFERENCES usuArio (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;