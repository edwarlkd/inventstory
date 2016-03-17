/**
 * Created by Andrew on 3/16/2016.
 */
package com.example.edward.inventstory;

        import java.util.ArrayList;
        import java.util.HashMap;
        import java.util.Hashtable;
        import android.content.ContentValues;
        import android.content.Context;
        import android.database.Cursor;
        import android.database.DatabaseUtils;
        import android.database.sqlite.SQLiteOpenHelper;
        import android.database.sqlite.SQLiteDatabase;

public class DBHelper extends SQLiteOpenHelper {

    public static final String DATABASE_NAME = "Invent_Story.db";
    public static final String USER_TABLE_NAME = "user";
    public static final String USER_TABLE_ID = "id";
    public static final String USER_TABLE_PASSWORD = "password";
    public static final String USER_TABLE_PHONE = "phone_number";
    public static final String USER_TABLE_EMAIL = "email";

    private HashMap hp;

    public DBHelper(Context context)
    {
        super(context, DATABASE_NAME , null, 1);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // TODO Auto-generated method stub
        db.execSQL(
                "create table user " +
                        "(userID String PRIMARY KEY, userName STRING, userPassword String, userPhoneNumber String, userEmail String)"
        );
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // TODO Auto-generated method stub
        db.execSQL("DROP TABLE IF EXISTS user");
        onCreate(db);
    }

    public boolean insertUser  (String user, String password, String phone_number,String email)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("user", user);
        contentValues.put("email", email);
        contentValues.put("password", password);
        contentValues.put("phone_number", phone_number);
        db.insert("user", null, contentValues);
        return true;
    }

    public Cursor getData(int id){
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor res =  db.rawQuery( "select * from contacts where id="+id+"", null );
        return res;
    }

    public int numberOfRows(){
        SQLiteDatabase db = this.getReadableDatabase();
        int numRows = (int) DatabaseUtils.queryNumEntries(db, USER_TABLE_NAME);
        return numRows;
    }

    public boolean updateContact (String user, String id, String password, String phone_number,String email)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("user", user);
        contentValues.put("id", id);
        contentValues.put("email", email);
        contentValues.put("password", password);
        contentValues.put("phone_number", phone_number);
        db.update("user", contentValues, "id = ? ", new String[] {} );
        return true;
    }

    public Integer deleteUser (String id)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        return db.delete("user",
                "id = ? ",
                new String[] {  });
    }

    public ArrayList<String> getAllCotacts()
    {
        ArrayList<String> array_list = new ArrayList<String>();

        //hp = new HashMap();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor res =  db.rawQuery( "select * from contacts", null );
        res.moveToFirst();

        while(res.isAfterLast() == false){
            array_list.add(res.getString(res.getColumnIndex(USER_TABLE_NAME)));
            res.moveToNext();
        }
        return array_list;
    }
}
