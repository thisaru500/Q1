import java.io.*;
import java.math.BigInteger;
import java.net.ServerSocket;
import java.net.Socket;
import java.security.SecureRandom;

public class RSA_S {
    private static final int PORT = 12345;
    private static BigInteger n, d, e;

    public static BigInteger gcd(BigInteger x, BigInteger y) {
        return x.gcd(y);
    }

    public static BigInteger selectPrime() {
        SecureRandom random = new SecureRandom();
        return BigInteger.probablePrime(512, random); // Use 512-bit primes
    }

    public static void main(String[] args) throws Exception {
        BigInteger p = selectPrime();
        BigInteger q = selectPrime();
        n = p.multiply(q);
        BigInteger phi = (p.subtract(BigInteger.ONE)).multiply(q.subtract(BigInteger.ONE));

        e = new BigInteger("65537"); // Common public exponent

        if (!gcd(e, phi).equals(BigInteger.ONE)) {
            throw new IllegalStateException("e is not coprime with phi");
        }

        d = e.modInverse(phi);

        System.out.println("Server is running...");
        System.out.println("Public Key: (e = " + e + ", n = " + n + ")");
        System.out.println("Private Key: (d = " + d + ", n = " + n + ")");

        try (ServerSocket serverSocket = new ServerSocket(PORT);
             Socket socket = serverSocket.accept();
             ObjectOutputStream out = new ObjectOutputStream(socket.getOutputStream());
             ObjectInputStream in = new ObjectInputStream(socket.getInputStream())) {

            System.out.println("Client connected.");

            out.writeObject(e);
            out.writeObject(n);
            out.flush();

            BigInteger encryptedMessage = (BigInteger) in.readObject();
            System.out.println("Encrypted message received: " + encryptedMessage);

            BigInteger decryptedMessage = encryptedMessage.modPow(d, n);
            String message = new String(decryptedMessage.toByteArray(), "UTF-8");
            System.out.println("Decrypted message: " + message);

            String response = "Message received: " + message;
            out.writeObject(response);
        }
    }
}