//Apex class from FND

global class ScheduleCaseAssignmentBatch implements Schedulable {

    global void execute(SchedulableContext sc) {

        // Run first batch
        Database.executeBatch(new CaseAssignmentBatch(), 200);

        // Run second batch in parallel
        Database.executeBatch(new CaseAssignmentHybridBatch(), 200);
    }
}