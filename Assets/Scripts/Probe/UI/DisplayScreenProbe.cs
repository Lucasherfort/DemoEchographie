using UnityEngine;

public class DisplayScreenProbe : MonoBehaviour
{
    static public DisplayScreenProbe Instance { get; private set; }

    [SerializeField]
    private GameObject CrossCamsHandler = null;
    [SerializeField]
    private Material composite = null;
    [SerializeField]
    private GameObject Screenrenderer = null;

    private void Awake()
    {
        if (Instance)
        {
            Destroy(this);
            return;
        }

        Instance = this;
    }

    private void Start()
    {
        CrossCamsHandler.SetActive(true);
        Screenrenderer.GetComponent<Renderer>().material = composite;
    }
}
