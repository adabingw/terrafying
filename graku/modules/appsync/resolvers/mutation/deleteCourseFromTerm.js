import { util } from '@aws-appsync/utils';

/**
 * Deletes an item with id `ctx.args.input.id` and type `ctx.args.input.type` from the DynamoDB table.
 * @param {import('@aws-appsync/utils').Context<{input: {id: unknown; type: unknown;}}>} ctx the context
 * @returns {import('@aws-appsync/utils').DynamoDBDeleteItemRequest} the request
 */
export function request(ctx) {
    const { id, type = "course" } = ctx.args.input;
    return {
        operation: 'DeleteItem',
        key: util.dynamodb.toMapValues({ term_id: id, type }),
    }
}

/**
 * Returns the deleted item. Throws an error if the operation failed.
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {*} the deleted item
 */
export function response(ctx) {
    const { error, result } = ctx;
    if (error) {
        return util.appendError(error.message, error.type, result);
    }
    return result;
}
