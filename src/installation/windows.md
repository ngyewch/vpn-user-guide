# Windows

Windows 10/11 has built-in support for IPsec/IKEv2.

1. Use `regedit` to add the following:

   |Name |Type |Value
   |- |- |-
   |HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Rasman\Parameters\NegotiateDH2048_AES256 |DWORD |2

   * For more details, see <https://wiki.strongswan.org/projects/strongswan/wiki/WindowsClients#AES-256-CBC-and-MODP2048>
