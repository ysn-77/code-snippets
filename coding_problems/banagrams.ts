function createCountHash(word: string) {
    let hash = {}
    for (let i = 0; i < word.length; i++) {
      let char = word[i];
      if (hash[char] == null) {
        hash[char] = 1;
      } else {
        hash[char]++;
      }
    }
  
    return hash;
  }
  
  function solution(word1: string, word2: string): boolean {
    let hash1 = createCountHash(word1);
    let hash2 = createCountHash(word2);
    let combined = Array.from(new Set(word1 + word2));
    let differences = 0;
  
    for (let i = 0; i < combined.length; i++) {
      let char = combined[i];
  
      if (hash1[char] === undefined) {
        differences += hash2[char];
      } else if (hash2[char] === undefined) {
        differences += hash1[char];
      } else {
        differences += Math.abs(hash1[char] - hash2[char]);
      }
    }
  
    return (differences <= 2 && differences != 0);
  }
  