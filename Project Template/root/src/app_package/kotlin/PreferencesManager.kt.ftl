package ${packageName}.data.preferences

import android.content.SharedPreferences
<#if di == "dagger">
import javax.inject.Inject
</#if>

open class PreferencesManager <#if di == "dagger">@Inject</#if> constructor(val prefs: SharedPreferences) {

    companion object {
    const val BOOLEAN = 1
    const val STRING = 2
    const val INTEGER = 3
    const val FLOAT = 4
    const val LONG = 5
  }

  fun saveOrUpdate(key: String, data: Any) {

    val editor: SharedPreferences.Editor = prefs.edit()

    when (data) {

      is String -> {
        editor.putString(key, data)
        editor.apply()
      }

      is Boolean -> {
        editor.putBoolean(key, data)
        editor.apply()
      }

      is Float -> {
        editor.putFloat(key, data)
        editor.apply()
      }

      is Int -> {
        editor.putInt(key, data)
        editor.apply()
      }

      is Long -> {
        editor.putLong(key, data)
        editor.apply()
      }
    }
  }

  fun get(key: String, type: Int): Any? {

    when (type) {

      STRING -> return prefs.getString(key, null)
      INTEGER -> return prefs.getInt(key, -1)
      FLOAT -> return prefs.getFloat(key, -1.0f)
      LONG -> return prefs.getLong(key, -1L)
      BOOLEAN -> return prefs.getBoolean(key, false)
    }

    throw RuntimeException("Type not suppported.")
  }

  fun getBoolean(key: String): Boolean {
    return prefs.getBoolean(key, false)
  }

  fun getString(key: String): String {
    return prefs.getString(key, null)
  }

  fun getFloat(key: String): Float {
    return prefs.getFloat(key, -1.0f)
  }

  fun getInt(key: String): Int {
    return prefs.getInt(key, -1)
  }

  fun getLong(key: String): Long {
    return prefs.getLong(key, -1L)
  }

  fun delete(key: String) {
    val editor: SharedPreferences.Editor = prefs.edit()
    editor.remove(key)
    editor.apply()
  }

}

