import { util } from "@aws-appsync/utils";

export function request(ctx) {
  console.log(ctx.source)
  const query = JSON.parse(
    util.transform.toDynamoDBConditionExpression({
      type: { eq: "item" },
    }),
  );

  const filter = JSON.parse(
    util.transform.toDynamoDBFilterExpression({
      course_id: { eq: ctx.source.id },
    }),
  );

  return {
    operation: "Query",
    index: "type-index",
    query,
    filter,
  };
}

export function response(ctx) {
  if (ctx.error) {
    util.error(ctx.error.message, ctx.error.type);
  }
  return ctx.result.items;
}
