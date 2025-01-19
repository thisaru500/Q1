import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.SecureRandom;
import java.util.Random;
import java.util.Scanner;

public class RSA_Client {
    private static final String HOST = "localhost";
    private static final int PORT = 12345;

    // Converts a string message to its numerical representation
    private static BigInteger msgToNumber(String message) {
        StringBuilder numberRepresentation = new StringBuilder();
        for (char c : message.toCharArray()) {
            int numericValue = c - 'A' + 1; // Converts A=1, B=2, ..., Z=26
            numberRepresentation.append(numericValue);
        }
        return new BigInteger(numberRepresentation.toString());
    }

    public static void main(String[] args) throws Exception {
        try (Socket socket = new Socket(HOST, PORT);
             ObjectOutputStream out = new ObjectOutputStream(socket.getOutputStream());
             ObjectInputStream in = new ObjectInputStream(socket.getInputStream())) {

            System.out.println("Connected to server.");

            // Receive public key from the server
            BigInteger e = (BigInteger) in.readObject();
            BigInteger n = (BigInteger) in.readObject();
            System.out.println("Public key received: (e = " + e + ", n = " + n + ")");

            // Prompt user for message input
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter the message to send: ");
            String message = scanner.nextLine().toUpperCase();
            System.out.println("Original message: " + message);

            // Convert the message to a numerical value
            BigInteger plaintext = msgToNumber(message);

            // Encrypt the message
            BigInteger encryptedMessage = plaintext.modPow(e, n);
            System.out.println("Encrypted message: " + encryptedMessage);

            // Send encrypted message to the server
            out.writeObject(encryptedMessage);

            // Receive response from the server
            String response = (String) in.readObject();
            System.out.println("Response from server: " + response);
        }
    }
}
