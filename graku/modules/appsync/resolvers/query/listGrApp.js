import { util } from '@aws-appsync/utils';

/**
 * Scans the DynamoDB datasource. Scans up to the provided `limit` and stards from the provided `NextToken` (optional).
 * @param {import('@aws-appsync/utils').Context<{filter?: any; limit?: number; nextToken?: string}>} ctx the context
 * @returns {import('@aws-appsync/utils').DynamoDBScanRequest} the request
 */
export function request(ctx) {
    const { filter, limit, nextToken } = ctx.args;
    return {
        operation: 'Scan',
        filter: filter ? JSON.parse(util.transform.toDynamoDBFilterExpression(filter)) : null,
        limit: limit ?? 20,
        nextToken,
    }
}

/**
 * Returns a list of items and a token.
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {{items: any[]; nextToken?: string}} the result
 */
export function response(ctx) {
    const { error, result } = ctx;
    if (error) {
        return util.appendError(error.message, error.type, result);
    }
    const { items = [], nextToken } = result;
    return { items, nextToken };
}
