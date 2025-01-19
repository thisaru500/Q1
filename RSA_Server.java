import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.SecureRandom;
import java.util.Random;

public class RSA_Server {
    private static final int PORT = 12345;

    private static BigInteger n, d, e;
    private static BigInteger p, q, phi;

    // Selects random prime numbers between 1-100
    private static BigInteger selectPrime() {
        Random random = new Random();
        while (true) {
            int candidate = random.nextInt(100) + 1;
            if (BigInteger.valueOf(candidate).isProbablePrime(100)) {
                return BigInteger.valueOf(candidate);
            }
        }
    }

    // Calculates the greatest common divisor (GCD)
    private static BigInteger gcd(BigInteger x, BigInteger y) {
        return x.gcd(y);
    }

    // Generates the public and private keys
    private static void generateKeys() {
        SecureRandom random = new SecureRandom();

        // Step 1: Generate two distinct prime numbers p and q
        p = selectPrime();
        q = selectPrime();
        while (p.equals(q)) { // Ensure p and q are distinct
            q = selectPrime();
        }

        // Step 2: Calculate n = p * q
        n = p.multiply(q);

        // Step 3: Calculate phi = (p - 1) * (q - 1)
        phi = (p.subtract(BigInteger.ONE)).multiply(q.subtract(BigInteger.ONE));

        // Step 4: Choose e such that 1 < e < phi and gcd(e, phi) = 1
        e = BigInteger.valueOf(65537); // Common choice for e
        while (gcd(e, phi).compareTo(BigInteger.ONE) != 0) {
            e = e.add(BigInteger.valueOf(2));
        }

        // Step 5: Calculate d as the modular multiplicative inverse of e mod phi
        d = e.modInverse(phi);
    }

    public static void main(String[] args) throws Exception {
        // Generate RSA keys
        generateKeys();

        System.out.println("Server is running...");
        System.out.println("Public Key: (e = " + e + ", n = " + n + ")");
        System.out.println("Private Key: (d = " + d + ", n = " + n + ")");

        try (ServerSocket serverSocket = new ServerSocket(PORT);
             Socket socket = serverSocket.accept();
             ObjectOutputStream out = new ObjectOutputStream(socket.getOutputStream());
             ObjectInputStream in = new ObjectInputStream(socket.getInputStream())) {

            System.out.println("Client connected.");

            // Send public key to the client
            out.writeObject(e);
            out.writeObject(n);
            out.flush();

            // Receive encrypted message from the client
            BigInteger encryptedMessage = (BigInteger) in.readObject();
            System.out.println("Encrypted message received: " + encryptedMessage);

            // Decrypt the message
            BigInteger decryptedMessage = encryptedMessage.modPow(d, n);
            String message = new String(decryptedMessage.toByteArray());
            System.out.println("Decrypted message: " + message);

            // Respond to the client with the decrypted message
            out.writeObject("Decrypted message: " + message);
        }
    }
}
