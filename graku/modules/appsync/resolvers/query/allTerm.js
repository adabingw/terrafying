import { util } from '@aws-appsync/utils';

export function request(ctx) {
  const { limit = 20, nextToken, type = "term" } = ctx.arguments;
  const index = 'type-index';
  const query = JSON.parse(
    util.transform.toDynamoDBConditionExpression({ type: { eq: type } })
  );
  return { operation: 'Query', index, query, limit, nextToken };
}

export function response(ctx) {
    const { error, result } = ctx;
    if (error) {
        return util.appendError(error.message, error.type, result);
    }
    const { items = [], nextToken } = result;
    return { items, nextToken };
}
