using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class GameManager : MonoBehaviour
{
    static public GameManager Instance{get; private set;}

    [SerializeField]
    private bool EnabledVR = false;

    private void Awake()
    {
        if(Instance)
        {
            Destroy(this);
            return;
        }

        Instance = this;
        UnityEngine.XR.XRSettings.enabled = EnabledVR;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (!Application.isEditor)
            {
                // AbortSimualtion
                System.Diagnostics.Process.GetCurrentProcess().Kill();
            }
        }
    }
}
