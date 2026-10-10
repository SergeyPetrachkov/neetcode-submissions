impl Solution {
    pub fn is_anagram(s: String, t: String) -> bool {
        if s.chars().count() != t.chars().count() {
            return false;
        }

        let mut dict: HashMap<char, i32> = HashMap::new();
        for (char1, char2) in s.chars().zip(t.chars()) {
            *dict.entry(char1).or_insert(0) += 1;
            *dict.entry(char2).or_insert(0) -= 1;
        }

        return dict.values().all( |&value|  value == 0);
    }
}
