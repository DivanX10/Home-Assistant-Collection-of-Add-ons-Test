#!/usr/bin/python3
import os
import shutil
import configparser
import logging
from logging import Logger


CONFIG_PATH = os.path.join(os.path.dirname(__file__), "config.ini")
if not os.path.exists(CONFIG_PATH):
    raise Exception(f"config.ini not found, need to be in path {CONFIG_PATH}")
cfg = configparser.ConfigParser()
cfg.sections()
cfg.read(CONFIG_PATH)


class IO:
    """ IO operations. """
    def __init__(self, log: Logger, mode: int, exist_ok: bool = True, debug: bool = False) -> None:
        self.mode: int = mode
        self.exist_ok: bool = exist_ok
        self.log: Logger = log
        self.debug: bool = debug

    def mkdir(self, name: str) -> None:
        """ Create directory. """
        if self.debug:
            self.log.info(msg=f"Try to make directory with path - {name}.")
        try:
            os.makedirs(name=name, mode=self.mode, exist_ok=self.exist_ok)
            if self.debug:
                self.log.info(msg=f"Directory make success.")
        except Exception as err:
            if self.debug:
                self.log.warning(msg=f"Something went wrong - {err}.")
            exit(code=err.args[0])

    def cp(self, name: str, destination: str) -> None:
        """ Copy directory recursive. """
        if self.debug:
            self.log.info(msg=f"Try to copy from - {name} to - {destination}")
        try:
            shutil.copytree(src=name, dst=destination, dirs_exist_ok=self.exist_ok)
            if self.debug:
                self.log.info(msg=f"Copy success.")
        except Exception as err:
            if self.debug:
                self.log.warning(msg=f"Something went wrong - {err}.")
            exit(code=err.args[0])


class Config:
    """ Configuration. """
    DEBUG: bool = bool(cfg["DEFAULT"]["DEBUG"])
    LOGGER_NAME: str = cfg["LOGGER"]["NAME"]
    LOGGER_PATH: str = os.path.join(os.path.dirname(__file__), LOGGER_NAME + ".log")
    LOGGER_FORMAT: str = f"%(asctime)s:::[%(levelname)s]:::%(message)s"
    LOGGER_ENCODING: str = cfg["LOGGER"]["ENCODING"]
    LOGGER_LEVEL: int = logging._nameToLevel.get(cfg["LOGGER"]["LEVEL"], "DEBUG")
    EXIST_OK: bool = bool(cfg["IO_SETTINGS"]["NOT_RISE_ERROR_IF_FILE_EXISTS"])
    MODE: int = int(cfg["IO_SETTINGS"]["CH_MODE"])
    FOLDER_DB_NAME: str = cfg["PATHS"]["FOLDER_DB_NAME"]
    FOLDER_UPLOAD_NAME: str = cfg["PATHS"]["FOLDER_UPLOADS_NAME"]
    FOLDER_PHOTOS_NAME: str = cfg["PATHS"]["FOLDER_PHOTOS_NAME"]
    CONTAINER_PATH: str = cfg["PATHS"]["CONTAINER_PATH"]
    DEEPSTACK_PATH: str = cfg["PATHS"]["DEEPSTACK_PATH"]
    DEEPSTACK_DB_PATH: str = os.path.join(DEEPSTACK_PATH, FOLDER_DB_NAME)
    DEEPSTACK_UPLOADS_PATH: str = os.path.join(DEEPSTACK_PATH, FOLDER_UPLOAD_NAME)
    CONTAINER_DB_PATH: str = os.path.join(CONTAINER_PATH, FOLDER_DB_NAME)
    CONTAINER_UPLOAD_PATH: str = os.path.join(CONTAINER_PATH, FOLDER_PHOTOS_NAME, FOLDER_UPLOAD_NAME)


if __name__ == '__main__':

    logging.basicConfig(
        filename=Config.LOGGER_PATH,
        encoding=Config.LOGGER_ENCODING,
        format=Config.LOGGER_FORMAT,
        level=Config.LOGGER_LEVEL
    )
    logger = logging.getLogger(name=Config.LOGGER_NAME)
    if Config.DEBUG:
        logger.info("Logger configurate.")

    if Config.DEBUG:
        logger.info("Creating a folder.")
    fs = IO(mode=Config.MODE, exist_ok=Config.EXIST_OK, log=logger, debug=Config.DEBUG)
    for path in [Config.DEEPSTACK_PATH, Config.DEEPSTACK_DB_PATH, Config.DEEPSTACK_UPLOADS_PATH]:
        fs.mkdir(name=path)

    if Config.DEBUG:
        logger.info("Copy from the Home Assistant to the container.")
    fs.cp(name=Config.DEEPSTACK_DB_PATH, destination=Config.CONTAINER_DB_PATH)
    fs.cp(name=Config.DEEPSTACK_UPLOADS_PATH, destination=Config.CONTAINER_UPLOAD_PATH)

    if Config.DEBUG:
        logger.info("Copy from the container to the Home Assistant.")
    fs.cp(name=Config.CONTAINER_DB_PATH, destination=Config.DEEPSTACK_PATH)
    fs.cp(name=Config.CONTAINER_UPLOAD_PATH, destination=Config.DEEPSTACK_UPLOADS_PATH)

    if Config.DEBUG:
        logger.info("Completed.")
