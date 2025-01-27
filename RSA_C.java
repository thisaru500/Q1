import java.io.*;
import java.math.BigInteger;
import java.net.Socket;
import java.util.Scanner;

public class RSA_C {
    private static final String HOST = "localhost";
    private static final int PORT = 12345;

    public static void main(String[] args) throws Exception {

        try (Socket socket = new Socket(HOST, PORT);
             ObjectOutputStream out = new ObjectOutputStream(socket.getOutputStream());
             ObjectInputStream in = new ObjectInputStream(socket.getInputStream())) {

            System.out.println("Connected to server.");
            BigInteger e = (BigInteger) in.readObject();
            BigInteger n = (BigInteger) in.readObject();
            System.out.println("Public key received: (e = " + e + ", n = " + n + ")");

            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter your message: ");
            String message = scanner.nextLine();
            System.out.println("Original message: " + message);

            BigInteger plaintext = new BigInteger(message.getBytes("UTF-8"));
            System.out.println("Numeric representation (as BigInteger): " + plaintext);

            BigInteger encryptedMessage = plaintext.modPow(e, n);
            System.out.println("Encrypted message: " + encryptedMessage);

            out.writeObject(encryptedMessage);
            String response = (String) in.readObject();
            System.out.println("Response from server: " + response);

        }

    }

}