import { util } from "@aws-appsync/utils";

export function request(ctx) {
    const { input } = ctx.args;
    const term = input.map((bundle) => {
        const { term } = bundle;
        util.dynamodb.toMapValues({term});
    })
    const course = input.map((bundle) => {
        const { courses } = bundle;
        courses.map((c) => util.dynamodb.toMapValues({c}));
    })
    const assigns = input.map((bundle) => {
        const { assignments } = bundle;
        assignments.map((assign) => util.dynamodb.toMapValues({assign}));
    })
    return {
        operation: "BatchPutItem",
        tables: {
          GRAPP: ctx.args.input.map((input1) => {
              util.dynamodb.toMapValues(input1.term);
              input1.courses.map((course) => util.dynamodb.toMapValues(course));
              input1.assignments.map((assigns) => util.dynamodb.toMapValues(assigns));
          }),
        },
      };
}

export function response(ctx) {
  if (ctx.error) {
    util.error(ctx.error.message, ctx.error.type);
  }
  return ctx.result.data.GRAPP;
}
