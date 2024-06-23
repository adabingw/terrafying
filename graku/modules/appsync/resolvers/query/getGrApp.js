import { util } from '@aws-appsync/utils';

/**
 * Sends a request to get an item with id `ctx.args.id` and type `ctx.args.type` from the DynamoDB table.
 * @param {import('@aws-appsync/utils').Context<{id: unknown; type: unknown;}>} ctx the context
 * @returns {import('@aws-appsync/utils').DynamoDBGetItemRequest} the request
 */
export function request(ctx) {
    const { id, type } = ctx.args;
    return {
        operation: 'GetItem',
        key: util.dynamodb.toMapValues({ id, type }),
    }
}

/**
 * Returns the fetched DynamoDB item.
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {*} the DynamoDB item
 */
export function response(ctx) {
    const { error, result } = ctx;
    if (error) {
        return util.appendError(error.message, error.type, result);
    }
    return result;
}
