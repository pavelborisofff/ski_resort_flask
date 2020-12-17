import logging
import logging.config


def init_logger(name: str, logfile: str = 'logger.ini') -> logging:
    """
    Initialize logger as root
    :param logfile:
    :param name:
    :return:
    """
    logging.config.fileConfig(logfile, disable_existing_loggers=False)
    return logging.getLogger(name)
