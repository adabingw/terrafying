locals {
    appsync = [
        {
            query_type = "Mutation"
            resolver_field = "createAssignment"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/createAssignment.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "createAssignmentBatch"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/createAssignmentBatch.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "createCourse"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/createCourse.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "createGrApp"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/createGrApp.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "createTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/createTerm.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "deleteAssignment"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/deleteAssignment.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "deleteAssignmentfromCourse"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/deleteAssignmentfromCourse.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "deleteAssignmentfromTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/deleteAssignmentfromTerm.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "deleteCourse"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/deleteCourse.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "deleteCoursefromTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/deleteCoursefromTerm.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "deleteGrApp"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/deleteGrApp.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "deleteTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/deleteTerm.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "updateAssignment"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/updateAssignment.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "updateCourse"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/updateCourse.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "updateGrApp"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/updateGrApp.js")
        },
        {
            query_type = "Mutation"
            resolver_field = "updateTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("mutation/updateTerm.js")
        },
        {
            query_type = "Query"
            resolver_field = "allTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("query/allTerm.js")
        },
        {
            query_type = "Query"
            resolver_field = "getAssignment"
            appsync_datasource_name = "graku_dynamo"
            code = file("query/getAssignment.js")
        },
        {
            query_type = "Query"
            resolver_field = "getAssignmentfromTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("query/getAssignmentfromTerm.js")
        },
        {
            query_type = "Query"
            resolver_field = "getCourse"
            appsync_datasource_name = "graku_dynamo"
            code = file("query/getCourse.js")
        },
        {
            query_type = "Query"
            resolver_field = "getGrApp"
            appsync_datasource_name = "graku_dynamo"
            code = file("query/getGrApp.js")
        },
        {
            query_type = "Query"
            resolver_field = "getTerm"
            appsync_datasource_name = "graku_dynamo"
            code = file("query/getTerm.js")
        },
        {
            query_type = "Query"
            resolver_field = "listGrApp"
            appsync_datasource_name = "graku_dynamo"
            code = file("query/listGrApp.js")
        }
    ]
}
