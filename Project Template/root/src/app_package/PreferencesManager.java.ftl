package ${packageName}.data.preferences;

import android.content.SharedPreferences;
import javax.inject.Inject;

public class PreferencesManager {

    public static final int BOOLEAN = 1;
    public static final int STRING = 2;
    public static final int INTEGER = 3;
    public static final int FLOAT = 4;
    public static final int LONG = 5;

    private SharedPreferences prefs;

    @Inject public PreferencesManager(SharedPreferences prefs) {
        this.prefs = prefs;
    }

    private void saveOrUpdate(String key, Object data) {

        SharedPreferences.Editor editor = prefs.edit();

        if (data instanceof String) {
            editor.putString(key, (String) data);
            editor.apply();
        }

        if (data instanceof Integer) {
            editor.putInt(key, (Integer) data);
            editor.apply();
        }

        if (data instanceof Boolean) {
            editor.putBoolean(key, (Boolean) data);
            editor.apply();
        }

        if (data instanceof Float) {
            editor.putFloat(key, (Float) data);
            editor.apply();
        }

        if (data instanceof Long) {
            editor.putLong(key, (Long) data);
            editor.apply();
        }
    }

    private Object get(String key, int type) {

        switch (type) {

            case BOOLEAN:
                return prefs.getBoolean(key, false);
            case STRING:
                return prefs.getString(key, null);
            case INTEGER:
                return prefs.getInt(key, -1);
            case FLOAT:
                return prefs.getFloat(key, -1.0f);
            case LONG:
                return prefs.getLong(key, -1L);
        }

        throw new RuntimeException("Type not supported");
    }

    private boolean getBoolean(String key) {
        return prefs.getBoolean(key, false);
    }

    private String getString(String key) {
        return prefs.getString(key, null);
    }

    private int getInt(String key) {
        return prefs.getInt(key, -1);
    }

    private float getFloat(String key) {
        return prefs.getFloat(key, -1.0f);
    }

    private long getLong(String key) {
        return prefs.getLong(key, -1L);
    }

    private void delete(String key) {
        SharedPreferences.Editor editor = prefs.edit();
        editor.remove(key);
        editor.apply();
    }
}
