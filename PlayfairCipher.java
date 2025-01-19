import java.util.*;

public class PlayfairCipher {

    private static char[][] matrix = new char[5][5];

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Step 1: Get the keyword from the user
        System.out.print("Enter the keyword: ");
        String keyword = scanner.nextLine().toUpperCase().replace("J", "I");

        // Step 2: Construct the 5x5 matrix
        constructMatrix(keyword);
        displayMatrix();

        // Step 3: Get plaintext from the user
        System.out.print("Enter the plaintext: ");
        String plaintext = scanner.nextLine().toUpperCase().replace("J", "I");
        if (plaintext.length() % 2 != 0) {
            plaintext += "Z"; // Append 'Z' if the length of the plaintext is odd
        }

        // Step 4: Encrypt the plaintext
        String ciphertext = encrypt(plaintext);
        System.out.println("Ciphertext: " + ciphertext);

        // Step 5: Decrypt the ciphertext
        String decryptedText = decrypt(ciphertext);
        System.out.println("Decrypted text: " + decryptedText);

        scanner.close();
    }

    private static void constructMatrix(String keyword) {
        Set<Character> seen = new LinkedHashSet<>();
        for (char c : keyword.toCharArray()) {
            if (Character.isLetter(c)) {
                seen.add(c);
            }
        }

        for (char c = 'A'; c <= 'Z'; c++) {
            if (c != 'J' && !seen.contains(c)) {
                seen.add(c);
            }
        }

        Iterator<Character> iterator = seen.iterator();
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (iterator.hasNext()) {
                    matrix[i][j] = iterator.next();
                }
            }
        }
    }

    private static void displayMatrix() {
        System.out.println("Constructed 5x5 Matrix:");
        for (char[] row : matrix) {
            for (char c : row) {
                System.out.print(c + " ");
            }
            System.out.println();
        }
    }

    private static String encrypt(String plaintext) {
        StringBuilder ciphertext = new StringBuilder();
        for (int i = 0; i < plaintext.length(); i += 2) {
            char a = plaintext.charAt(i);
            char b = plaintext.charAt(i + 1);
            int[] posA = findPosition(a);
            int[] posB = findPosition(b);

            if (posA[0] == posB[0]) { // Same row

	ciphertext.append(matrix[posA[0]][(posA[1] + 1) % 5]);
                ciphertext.append(matrix[posB[0]][(posB[1] + 1) % 5]);
            } else if (posA[1] == posB[1]) { // Same column
                ciphertext.append(matrix[(posA[0] + 1) % 5][posA[1]]);
                ciphertext.append(matrix[(posB[0] + 1) % 5][posB[1]]);
            } else { // Rectangle swap
                ciphertext.append(matrix[posA[0]][posB[1]]);
                ciphertext.append(matrix[posB[0]][posA[1]]);
            }
        }
        return ciphertext.toString();
    }

    private static String decrypt(String ciphertext) {
        StringBuilder plaintext = new StringBuilder();
        for (int i = 0; i < ciphertext.length(); i += 2) {
            char a = ciphertext.charAt(i);
            char b = ciphertext.charAt(i + 1);
            int[] posA = findPosition(a);
            int[] posB = findPosition(b);

            if (posA[0] == posB[0]) { // Same row
                plaintext.append(matrix[posA[0]][(posA[1] + 4) % 5]);
                plaintext.append(matrix[posB[0]][(posB[1] + 4) % 5]);
            } else if (posA[1] == posB[1]) { // Same column
                plaintext.append(matrix[(posA[0] + 4) % 5][posA[1]]);
                plaintext.append(matrix[(posB[0] + 4) % 5][posB[1]]);
            } else { // Rectangle swap
                plaintext.append(matrix[posA[0]][posB[1]]);
                plaintext.append(matrix[posB[0]][posA[1]]);
            }
        }
        return plaintext.toString();
    }

    private static int[] findPosition(char c) {
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (matrix[i][j] == c) {
                    return new int[]{i, j};
                }
            }
        }
        return null; // Should never happen
    }
}
