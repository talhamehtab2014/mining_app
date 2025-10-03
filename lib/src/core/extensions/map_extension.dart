extension DefaultValueMap<K, V> on Map<K, V> {
  V getWithDefault(K key, V defaultValue) {
    return this[key] ?? defaultValue;
  }
}
