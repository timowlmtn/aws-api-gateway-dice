import json
import traceback
import logging
import boto3
import re
import random

logger = logging.getLogger()
logger.setLevel(logging.INFO)
global_error = None


try:
    cloudWatch = boto3.client('cloudwatch')
except Exception as global_exc:
    logger.error(global_exc)
    global_error = "ERROR: " + str(global_exc)


def roll_dice(event, context):
    """
    A function to roll dice.

    :param event:
    :param context:
    :return:
    """
    try:
        result = "Usage: https://$url/roll/3d6+1"
        if event["pathParameters"] is not None:
            match = re.match(r"([0-9]+)d([0-9]+)([\\+,\\-]?[0-9]*)", event["pathParameters"]["proxy"])
            if match:
                result = dict()
                result["count"] = match.group(1)
                result["dice"] = match.group(2)
                result["modifier"] = match.group(3)
                rolls = list()
                for dice in range(0, int(match.group(1))):
                    rolls.append(random.randint(1, int(match.group(2))))
                result["rolls"] = rolls
                modifier = 0
                if match.group(3):
                    modifier = int(match.group(3))

                result["total"] = sum(rolls) + modifier
            else:
                result = f'Invalid dice: {event["pathParameters"]["proxy"]}'

    except Exception as exception:
        message = f"ERROR: {exception} {traceback.format_exc().splitlines()}"
        logger.error(message)
        result = message

    return respond(None, result)


def respond(err, res=None):
    """
    Create an HTML response

    :param err:
    :param res:
    :return:
    """
    return {
        'statusCode': '400' if err else '200',
        'body': err.message if err else json.dumps(res),
        'headers': {
            'Content-Type': 'application/json',
        },
    }
