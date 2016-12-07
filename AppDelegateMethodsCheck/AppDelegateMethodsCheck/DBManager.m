//
//  DBManager.m
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 29/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager


static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}


-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"student.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "create table if not exists studentsDetail (regno integer primary key, name text, department text, year text)";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}



- (BOOL) saveData:(NSString*)registerNumber name:(NSString*)name
       department:(NSString*)department year:(NSString*)year;
{
    NSLog(@"save data function has been called");
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into studentsDetail (regno,name, department, year) values (\"%ld\",\"%@\", \"%@\", \"%@\")",[registerNumber integerValue],name,department, year];
                                const char *insert_stmt = [insertSQL UTF8String];
                                sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
                                if (sqlite3_step(statement) == SQLITE_DONE)
                                {
                                    NSLog(@"data saved successfully");
                                    sqlite3_reset(statement);
                                    return YES;
                                }
                                else
                                {
                                    NSLog(@"data has not been saved");
                                    sqlite3_reset(statement);
                                    return NO;
                                }
        
    }
                                return NO;
}
                                
                                
                                
- (NSArray*) findByRegisterNumber:(NSString*)registerNumber
        {
            const char *dbpath = [databasePath UTF8String];
            if (sqlite3_open(dbpath, &database) == SQLITE_OK)
            {
                NSString *querySQL = [NSString stringWithFormat: @"select name, department, year from studentsDetail where regno=\"%@\"",registerNumber];
                const char *query_stmt = [querySQL UTF8String];
                NSMutableArray *resultArray = [[NSMutableArray alloc]init];
                if (sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL) == SQLITE_OK)
                {
                    if (sqlite3_step(statement) == SQLITE_ROW)
                    {
                        NSString *name = [[NSString alloc] initWithUTF8String:
                                          (const char *) sqlite3_column_text(statement, 0)];
                        [resultArray addObject:name];
                        NSString *department = [[NSString alloc] initWithUTF8String:
                                                (const char *) sqlite3_column_text(statement, 1)];
                        [resultArray addObject:department];
                        NSString *year = [[NSString alloc]initWithUTF8String:
                                          (const char *) sqlite3_column_text(statement, 2)];
                        [resultArray addObject:year];
                        sqlite3_reset(statement);
                        return resultArray;
                    }
                    else{
                        NSLog(@"Not found");
                        sqlite3_reset(statement);
                        return nil;
                    }
                   // sqlite3_reset(statement);
                }
            }
            return nil;
        }


-(int) countNumberOfRows
{
    
    
    int count=0;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        
//        
//        NSString *querySQL = [NSString stringWithFormat: @"select * from studentsDetail"];
//        const char *query_stmt = [querySQL UTF8String];
//        
//        //const char* sqlStatement = "SELECT * FROM studentsDetail";
//        sqlite3_stmt *statement;
//        if( sqlite3_prepare_v2(studentsDetail, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
//        {
//            int count = 0;
//            while( sqlite3_step(statement) == SQLITE_ROW )
//                count++;
//        }
        
        const char* sqlStatement = "SELECT COUNT(*) FROM studentsDetail";
        sqlite3_stmt *statement;
        
        if( sqlite3_prepare_v2(database, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
        {
            //Loop through all the returned rows (should be just one)
            while( sqlite3_step(statement) == SQLITE_ROW )
            {
                count = sqlite3_column_int(statement, 0);
            }
        }
        else
        {
            NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
        }
        
        // Finalize and close database.
        
        
    }

    
    return count;
}




@end
